%% Time profile with iri2026
glat = -11.95;
glon = -76.77;
altkmrange = [100, 200, 20];
t0 = datetime(2004,11,21,0,0,0);
t1 = datetime(2004,11,22,0,0,0);
ts = seconds(3600);

cwd = fileparts(mfilename('fullpath'));
addpath(fullfile(cwd, '..'));

times = t0:ts:t1;

for i = 1:length(times)
  iri(i) = iri2026.iri2026(times(i), glat, glon, altkmrange); %#ok<SAGROW>
end

iri2026.plottime(iri, times, glat, glon)
