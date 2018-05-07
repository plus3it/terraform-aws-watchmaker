#Outputs from the Linux Instance Terraform module.

output "watchmaker-lx-instance-stack-id" {
  description = "CloudFormation stack id"
  value       = "${aws_cloudformation_stack.watchmaker-lx-instance.id}"
}

output "watchmaker-lx-instance-id" {
  description = "Instance ID"
  value       = "${aws_cloudformation_stack.watchmaker-lx-instance.outputs["WatchmakerInstanceId"]}"
}

output "watchmaker-lx-instance-log-group-name" {
  description = "Log Group Name"
  value       = "${aws_cloudformation_stack.watchmaker-lx-instance.outputs["WatchmakerInstanceLogGroupName"]}"
}
