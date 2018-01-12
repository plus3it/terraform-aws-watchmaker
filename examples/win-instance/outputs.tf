#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${module.win-instance.watchmaker-win-instance-stack-id}"
}

output "watchmaker-win-instance-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${module.win-instance.watchmaker-win-instance-stack-outputs}"
}
