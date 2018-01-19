# Cloudformation Terraform module for a Linux Watchmaker instance

provider "aws" {
  profile = "test123prof"
}

module "lx-instance" {
  source = "git::https://github.com/plus3it/terraform-aws-watchmaker//modules/lx-instance/"

  Name             = "test123lxstack"
  AmiId            = "ami-1c8ee466"
  AmiDistro        = "CentOS"
  AppVolumeSize    = "10"
  KeyPairName      = "test123key"
  InstanceRole     = "test123role"
  PrivateIp        = ""
  NoPublicIp       = "false"
  SecurityGroupIds = "sg-12345678"
  SubnetId         = "subnet-12345678"
}
