#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale" {
  description = "CloudFormation stack object for watchmaker-win-autoscale"
  value       = module.win-autoscale.watchmaker-win-autoscale
}
