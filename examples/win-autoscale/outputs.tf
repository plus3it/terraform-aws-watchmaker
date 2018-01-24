#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale-stack-id" {
  description = "This output provides the CloudFormation stack id of the Watchmaker Linux instance"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-stack-id}"
}

output "watchmaker-win-autoscale-stack-outputs" {
  description = "This output provides the outputs of the CloudFormation stack"
  value       = "${module.win-autoscale.watchmaker-win-autoscale-stack-outputs}"
}
