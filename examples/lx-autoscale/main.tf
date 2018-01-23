# Cloudformation Terraform module for a Linux Watchmaker AutoScaling Group

provider "aws" {
  profile = "test123prof"
}

module "lx-autoscale" {
  source = "git::https://github.com/plus3it/terraform-aws-watchmaker//modules/lx-autoscale/"

  Name             = "test123autostack"
  AmiId            = "ami-1c8ee466"
  AmiDistro        = "CentOS"
  AppVolumeSize    = "10"
  KeyPairName      = "test123key"
  InstanceRole     = "test123role"
  NoPublicIp       = "false"
  SecurityGroupIds = "sg-12345678"
  SubnetIds        = "subnet-12345678,subnet-87654321"
}
