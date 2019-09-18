#Outputs from the Windows Autoscaling Terraform module.

output "watchmaker-win-autoscale" {
  description = "CloudFormation stack object for watchmaker-win-autoscale"
  value       = aws_cloudformation_stack.watchmaker-win-autoscale
}
