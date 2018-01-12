#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${aws_cloudformation_stack.watchmaker-lx-autoscale.id}"
}

output "watchmaker-lx-autoscale-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${aws_cloudformation_stack.watchmaker-lx-autoscale.outputs}"
}
