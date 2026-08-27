function plan = buildfile
plan = buildplan(localfunctions);
plan.DefaultTasks = "test";
plan("test").Dependencies = "check";
end

function checkTask(~)
% Identify code issues (recursively all Matlab .m files)
for pkg = ["+iri2016", "+iri2020", "+iri2026"]
  issues = codeIssues(pkg);
  assert(isempty(issues.Issues), formattedDisplayText(issues.Issues))
end
end

function testTask(~)
r = runtests(["iri2016", "iri2020", "iri2026"], strict=true, UseParallel=false);
% UseParallel can be a lot slower, especially on Mac
assert(~isempty(r), "No tests were run")
assertSuccess(r)
end
