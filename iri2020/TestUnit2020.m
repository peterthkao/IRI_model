classdef TestUnit2020 < matlab.unittest.TestCase

methods (Test)

function test_simple(tc)
time = datetime(2015,12,13,10,0,0);
glat = 65.1;
glon = -147.5;
altkmrange = [100,1000,10];

iono = iri2020(time, glat, glon, altkmrange);

tc.verifyEqual(iono.Ne(11), 5.287032830e9, 'RelTol', 1e-4)
end

end
end
