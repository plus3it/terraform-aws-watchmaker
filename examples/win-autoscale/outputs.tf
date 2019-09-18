#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale" {
  description = "CloudFormation stack object for watchmaker-win-autoscale"
  value       = module.win-autoscale.watchmaker-win-autoscale
}

output "watchmaker-win-autoscale-scale-down-scheduled-action" {
  description = "This output provides the Scale Down Scheduled Action ID"
  value = lookup(
    module.win-autoscale.watchmaker-win-autoscale.outputs,
    "ScaleDownScheduledAction",
    "",
  )
}
