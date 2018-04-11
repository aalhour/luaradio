local radio = require('radio')
local jigs = require('tests.jigs')
local buffer = require('tests.buffer')

jigs.TestSourceBlock(radio.ZeroSource, {
    {
        desc = "Data type ComplexFloat32, rate 1",
        args = {radio.types.ComplexFloat32, 1},
        inputs = {},
        outputs = {radio.types.ComplexFloat32.vector_from_array({{0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}, {0.00000000, 0.00000000}})}
    },
    {
        desc = "Data type Float32, rate 1",
        args = {radio.types.Float32, 1},
        inputs = {},
        outputs = {radio.types.Float32.vector_from_array({0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 0.00000000})}
    },
}, {epsilon = 1.0e-06})