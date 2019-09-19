#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance" {
  description = "CloudFormation stack object for watchmaker-win-instance"
  value       = module.win-instance.watchmaker-win-instance
}
