#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance-stack-id" {
  description = "CloudFormation stack id"
  value       = aws_cloudformation_stack.watchmaker-win-instance.id
}

output "watchmaker-win-instance-id" {
  description = "Instance ID"
  value = lookup(
    aws_cloudformation_stack.watchmaker-win-instance.outputs,
    "WatchmakerInstanceId",
    "",
  )
}

output "watchmaker-win-instance-log-group-name" {
  description = "Log Group Name"
  value = lookup(
    aws_cloudformation_stack.watchmaker-win-instance.outputs,
    "WatchmakerInstanceLogGroupName",
    "",
  )
}
