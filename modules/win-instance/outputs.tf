#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Windows instance"
  value       = "${aws_cloudformation_stack.watchmaker-win-instance.id}"
}

output "watchmaker-win-instance-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${aws_cloudformation_stack.watchmaker-win-instance.outputs}"
}
