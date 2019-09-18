#Outputs from the Linux Autoscaling Terraform module.

output "watchmaker-lx-autoscale-stack" {
  description = "CloudFormation stack object for watchmaker-lx-autoscale"
  value       = aws_cloudformation_stack.watchmaker-lx-autoscale
}
