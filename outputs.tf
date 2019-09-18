# ------------------------------------------------------------------------------------------------------------------------
# This file contains outputs associated with the Linux instance Terraform module.  It is only for example purposes
# as part of the root 'main.tf'.  For other modules, use the accompanying 'outputs.tf' file in that subdirectory.
# ------------------------------------------------------------------------------------------------------------------------

output "watchmaker-lx-instance-stack" {
  description = "CloudFormation stack object for watchmaker-lx-instance-stack"
  value       = module.lx-instance.watchmaker-lx-instance-stack
}
