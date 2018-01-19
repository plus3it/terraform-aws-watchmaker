# Cloudformation Terraform module for a Linux Watchmaker instance

provider "aws" {
  profile = "test123prof"
}

module "win-autoscale" {
  source = "git::https://github.com/plus3it/terraform-aws-watchmaker//modules/win-autoscale/"

  Name             = "test123winautostack"
  AmiId            = "ami-0a792a70"
  AppVolumeSize    = "10"
  KeyPairName      = "test123key"
  InstanceRole     = "test123role"
  NoPublicIp       = "false"
  SecurityGroupIds = "sg-12345678"
  SubnetIds        = "subnet-12345678,subnet-87654321"
}
