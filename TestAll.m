% run all Matlab tests for the three IRI models
results = runtests({'iri2016.TestUnit', 'iri2020.TestUnit', 'iri2026.TestUnit'});
assert(~isempty(results), "no tests found")
assertSuccess(results)
