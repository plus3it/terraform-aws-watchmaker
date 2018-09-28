module "lx-instance-centos6" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-centos6"
  AmiId                 = "${data.aws_ami.centos6.image_id}"
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_lx}"
  InstanceRole          = "${var.instance_role}"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetId              = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "lx-instance-centos7" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-centos7"
  AmiId                 = "${data.aws_ami.centos7.image_id}"
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_lx}"
  InstanceRole          = "${var.instance_role}"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetId              = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "lx-autoscale-centos6" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-centos6"
  AmiId                 = "${data.aws_ami.centos6.image_id}"
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_lx}"
  InstanceRole          = "${var.instance_role}"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetIds             = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "lx-autoscale-centos7" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-centos7"
  AmiId                 = "${data.aws_ami.centos7.image_id}"
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_lx}"
  InstanceRole          = "${var.instance_role}"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetIds             = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-instance-2008R2" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2008R2"
  AmiId                 = "${data.aws_ami.windows2008R2.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetId              = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-instance-2012R2" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2012R2"
  AmiId                 = "${data.aws_ami.windows2012R2.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetId              = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-instance-2016" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2016"
  AmiId                 = "${data.aws_ami.windows2016.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetId              = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-autoscale-2008R2" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2008R2"
  AmiId                 = "${data.aws_ami.windows2008R2.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetIds             = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-autoscale-2012R2" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2012R2"
  AmiId                 = "${data.aws_ami.windows2012R2.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetIds             = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}

module "win-autoscale-2016" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2016"
  AmiId                 = "${data.aws_ami.windows2016.image_id}"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = "${var.cloudwatch_agent_url_win}"
  InstanceRole          = "${var.instance_role}"
  InstanceType          = "t2.medium"
  KeyPairName           = "${local.keypair_name}"
  NoPublicIp            = "false"
  SecurityGroupIds      = "${local.security_group}"
  SubnetIds             = "${var.subnet_id}"
  WatchmakerConfig      = "${var.watchmaker_config}"
  WatchmakerEnvironment = "${var.watchmaker_env}"
}
