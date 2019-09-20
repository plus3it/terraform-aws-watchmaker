#Outputs from the Windows Instance Terraform module.

output "watchmaker-win-instance" {
  description = "CloudFormation stack object for watchmaker-win-instance"
  value       = aws_cloudformation_stack.watchmaker-win-instance
}
