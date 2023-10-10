/**
 * This is an automatically generated file
 * @name Hello world
 * @kind problem
 * @problem.severity warning
 * @id javascript/example/hello-world
 */

 import javascript
 import semmle.javascript.Actions
 
 from string file, YamlNode accesskey, Actions::Workflow workflow,  Actions::Job job, Actions::Step step, Actions::Uses uses, Actions::With with
 where 
 exists(step.getUses()) and
 step.getUses() = uses and
 uses.getGitHubRepository() = "aws-actions/configure-aws-credentials" and
 step.getJob() = job and
 job.getWorkflow() = workflow and
 workflow.getFileName() = file and
 with.getStep() = step and
 with.lookup("aws-access-key-id") = accesskey
 select step, "AWS-ACCESS_KEY_ID used as AWS credential. Action '" + uses.getGitHubRepository() + "' in ' step $@ ' uses aws-access-key-id, not an OIDC token", step, step.toString()
 