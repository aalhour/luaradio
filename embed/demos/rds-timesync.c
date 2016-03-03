#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>

#include <luaradio.h>

const char *script_template =
    "local frequency = %s\n"
    "local offset = -600e3\n"
    ""
    "local top = radio.CompositeBlock()\n"
    "local a0 = radio.RtlSdrSource(frequency + offset, 2048000)\n"
    "local a1 = radio.TunerBlock(offset, 190e3, 10)\n"
    "local a2 = radio.FrequencyDiscriminatorBlock(5.0)\n"
    "local a3 = radio.HilbertTransformBlock(257)\n"
    "local f0 = radio.BandpassFilterBlock(165, {18e3, 20e3})\n"
    "local b1 = radio.PLLBlock(1000.0, 19e3-100, 19e3+100, 3.0)\n"
    "local c0 = radio.PLLBlock(1000.0, 19e3-100, 19e3+100, 1/16.0)\n"
    "local c1 = radio.DelayBlock(35)\n"
    "local c2 = radio.ComplexToRealBlock()\n"
    "local a4 = radio.MultiplyConjugateBlock()\n"
    "local a5 = radio.LowpassFilterBlock(256, 4e3)\n"
    "local a6 = radio.RootRaisedCosineFilterBlock(101, 1, 1187.5)\n"
    "local a7 = radio.BinaryPhaseCorrectorBlock(2000)\n"
    "local e0 = radio.SamplerBlock()\n"
    "local e1 = radio.ComplexToRealBlock()\n"
    "local e2 = radio.SlicerBlock()\n"
    "local e3 = radio.DifferentialDecoderBlock()\n"
    "local e4 = radio.RDSFrameBlock()\n"
    "local e5 = radio.FileDescriptorSink(%d)\n"
    ""
    "top:connect(a0, a1, a2, a3, f0)\n"
    "top:connect(f0, b1)\n"
    "top:connect(a3, 'out', a4, 'in1')\n"
    "top:connect(b1, 'out', a4, 'in2')\n"
    "top:connect(f0, c0, c1, c2)\n"
    "top:connect(a4, a5, a6, a7)\n"
    "top:connect(a7, 'out', e0, 'data')\n"
    "top:connect(c2, 'out', e0, 'clock')\n"
    "top:connect(e0, e1, e2, e3, e4, e5)\n"
    "return top";

typedef struct {
    uint16_t blocks[4];
} rds_frame_t;

time_t rds_decode_time(const rds_frame_t *time_frame) {
    /* See RDS Standard 3.1.5.6, pg. 28 */
    /* Time frame bit layout:
     *   [XXXX_XXXX_XXXX_XXXX] | [XXXX_XXXX_XXXX_XXDD]
     *   [DDDD_DDDD_DDDD_DDDH] | [HHHH_MMMM_MMOO_OOOO]
     * MJD = blocks[1][1:0], blocks[2][15:1]
     * Hour = blocks[2][0], blocks[3][15:12]
     * Minute = blocks[3][11:6] */
    uint32_t mjd = ((time_frame->blocks[1] & 0x3) << 15) | ((time_frame->blocks[2] & 0xfffe) >> 1);
    uint32_t hour = ((time_frame->blocks[2] & 0x1) << 4) | ((time_frame->blocks[3] & 0xf000) >> 12);
    uint32_t minute = ((time_frame->blocks[3] >> 6) & 0x3f);

    /* See RDS Standard Annex G, pg. 81 */
    /* Convert MJD to year, month, day */
    uint32_t yp = (uint32_t)( ((float)mjd - 15078.2) / 365.25);
    uint32_t mp = (uint32_t)( ( (float)mjd - 14956.1 - ((uint32_t)((float)yp * 365.25)) ) / 30.6001);
    uint32_t k = (mp == 14 || mp == 15) ? 1 : 0;
    uint32_t day = mjd - 14956 - ((uint32_t)((float)yp * 365.25)) - ((uint32_t)((float)mp * 30.6001));
    uint32_t month = mp - 1 - k * 12;
    uint32_t year = yp + k;

    /* Convert UTC hour, minute, year, month, day to time_t */
    struct tm tm = {
        .tm_sec = 0, .tm_min = minute, .tm_hour = hour,
        .tm_mday = day, .tm_mon = month - 1, .tm_year = year,
        .tm_isdst = -1,
    };
    return timegm(&tm);
}

int main(int argc, char *argv[]) {
    radio_t *radio;
    char script[2048];
    int pipe_fds[2];

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <FM radio frequency>\n", argv[0]);
        return -1;
    }

    if (pipe(pipe_fds) < 0) {
        perror("pipe()");
        return -1;
    }

    snprintf(script, sizeof(script), script_template, argv[1], pipe_fds[1]);

    if ((radio = luaradio_new()) == NULL) {
        perror("Allocating memory");
        return -1;
    }

    if (luaradio_load(radio, script) < 0) {
        fprintf(stderr, "Error loading script: %s\n", luaradio_strerror(radio));
        return -1;
    }

    if (luaradio_start(radio) < 0) {
        fprintf(stderr, "Error starting script: %s\n", luaradio_strerror(radio));
        return -1;
    }

    rds_frame_t frame;

    for (unsigned int frame_count = 1; ; frame_count++) {
        /* Read RDS frame from the pipe */
        if (read(pipe_fds[0], &frame, sizeof(frame)) != sizeof(frame)) {
            perror("read()");
            return -1;
        }

        printf("\rRDS frames received:  % 5d", frame_count);

        /* Check it's a time frame (group = 0x4, version = 0x0) */
        uint32_t group = frame.blocks[1] >> 12 & 0xf;
        uint32_t version = (frame.blocks[1] >> 11) & 0x1;
        if (group == 0x4 && version == 0) {
            printf("\nRDS time frame found!\n");
            break;
        }
    }

    if (luaradio_stop(radio) < 0) {
        fprintf(stderr, "Error stopping script: %s\n", luaradio_strerror(radio));
        return -1;
    }

    /* Decode the time */
    time_t t = rds_decode_time(&frame);

    printf("Setting time to %s", ctime(&t));

    /* Set the time */
    struct timespec ts = { .tv_sec = t, .tv_nsec = 0 };
    if (clock_settime(CLOCK_REALTIME, &ts) < 0) {
        perror("clock_settime()");
        return -1;
    }

    luaradio_free(radio);

    return 0;
}