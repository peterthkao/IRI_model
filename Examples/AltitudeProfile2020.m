clear;clc;close all;
time = datetime(2025,12,13,10,0,0);
glat = 65.1;
glon = -147.5;
altkmrange = [100,1000,10];

cwd = fileparts(mfilename('fullpath'));
addpath(fullfile(cwd, '..'));

iono = iri2020.iri2020(time, glat, glon,altkmrange);

iri2020.plotiono(iono, time, glat, glon)
