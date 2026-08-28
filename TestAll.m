% run all Matlab tests for the three IRI models
cwd = fileparts(mfilename('fullpath'));
results = runtests({fullfile(cwd, 'iri2016'), fullfile(cwd, 'iri2020'), fullfile(cwd, 'iri2026')});
assert(~isempty(results), "no tests found")
assertSuccess(results)
