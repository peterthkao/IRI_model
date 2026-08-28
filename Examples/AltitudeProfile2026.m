clear;clc;close all;
time = datetime(2027,12,13,10,0,0);
glat = 65.1;
glon = -147.5;
altkmrange = [100,1000,10];

cwd = fileparts(mfilename('fullpath'));
addpath(fullfile(cwd, '..', 'iri2026'));

iono = iri2026(time, glat, glon,altkmrange);

plotiono2026(iono, time, glat, glon)
