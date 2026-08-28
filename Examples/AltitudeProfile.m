time = datetime(2015,12,13,10,0,0);
glat = 65.1;
glon = -147.5;
altkmrange = [100,1000,10];

cwd = fileparts(mfilename('fullpath'));
addpath(fullfile(cwd, '..', 'iri2016'));

iono = iri2016(time, glat, glon,altkmrange);

plotiono2016(iono, time, glat, glon)
