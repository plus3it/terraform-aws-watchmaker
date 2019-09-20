#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale" {
  description = "CloudFormation stack object for watchmaker-lx-autoscale"
  value       = module.lx-autoscale.watchmaker-lx-autoscale
}
