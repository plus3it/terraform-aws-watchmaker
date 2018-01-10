# Cloudformation Terraform module for a Linux Watchmaker instance

provider "aws" {
  profile = "test123prof"
}

module "lx-instance" {
  source = "../../"

  Name                   ="test123stack"
  AmiId                  = "ami-1c8ee466"
  AmiDistro              = "CentOS"
  AppVolumeSize          = "10"
  KeyPairName            = "test123key"
  InstanceRole           = "test123role"
  PrivateIp              = ""
  NoPublicIp             = "false"
  SecurityGroupIds       = "sg-<number>"
  SubnetId               = "subnet-<number>"
}
