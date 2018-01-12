#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale-stack-id" {
  description = "This output provides the CloudFormation stack id"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.id}"
}

output "watchmaker-win-autoscale-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${aws_cloudformation_stack.watchmaker-win-autoscale.outputs}"
}
