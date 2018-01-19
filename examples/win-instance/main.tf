# Cloudformation Terraform module for a Windows Watchmaker instance

provider "aws" {
  profile = "test123prof"
}

module "win-instance" {
  source = "git::https://github.com/plus3it/terraform-aws-watchmaker//modules/win-instance/"

  Name             = "test123winstack"
  AmiId            = "ami-0a792a70"
  AppVolumeSize    = "10"
  KeyPairName      = "test123key"
  InstanceRole     = "test123role"
  PrivateIp        = ""
  NoPublicIp       = "false"
  SecurityGroupIds = "sg-12345678"
  SubnetId         = "subnet-87654321"
}
