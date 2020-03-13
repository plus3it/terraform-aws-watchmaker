terraform {
  required_version = ">= 0.12"
}

resource "aws_sns_topic" "tf-aws-wam" {
  name = "${local.test_prefix}-topic"
}

module "lx-instance-centos6" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-centos6"
  AmiId                 = data.aws_ami.centos6.image_id
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_centos
  DisableRollback       = "true"
  EbsOptimized          = "false"
  InstanceRole          = var.instance_role
  InstanceType          = "t2.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
}

module "lx-instance-centos7" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-centos7"
  AmiId                 = data.aws_ami.centos7.image_id
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_centos
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
}

module "lx-autoscale-centos6" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-centos6"
  AmiId                 = data.aws_ami.centos6.image_id
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  AsgMetrics            = var.AsgMetrics
  AsgNotificationTypes  = var.AsgNotificationTypes
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_centos
  DisableRollback       = "true"
  EbsOptimized          = "false"
  InstanceRole          = var.instance_role
  InstanceType          = "t2.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
}

module "lx-autoscale-centos7" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-centos7"
  AmiId                 = data.aws_ami.centos7.image_id
  AmiDistro             = "CentOS"
  AppVolumeSize         = "10"
  AsgMetrics            = var.AsgMetrics
  AsgNotificationTypes  = var.AsgNotificationTypes
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_centos
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
}

module "win-instance-2012R2" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2012R2"
  AmiId                 = data.aws_ami.windows2012R2.image_id
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
}

module "win-instance-2016" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2016"
  AmiId                 = data.aws_ami.windows2016.image_id
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
}

module "win-autoscale-2012R2" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2012R2"
  AmiId                 = data.aws_ami.windows2012R2.image_id
  AppVolumeSize         = "10"
  AsgMetrics            = var.AsgMetrics
  AsgNotificationTypes  = var.AsgNotificationTypes
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
}

module "win-autoscale-2016" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2016"
  AmiId                 = data.aws_ami.windows2016.image_id
  AppVolumeSize         = "10"
  AsgMetrics            = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  AsgNotificationTypes  = ["autoscaling:EC2_INSTANCE_LAUNCH", "autoscaling:EC2_INSTANCE_LAUNCH_ERROR", "autoscaling:EC2_INSTANCE_TERMINATE", "autoscaling:EC2_INSTANCE_TERMINATE_ERROR", "autoscaling:TEST_NOTIFICATION"]
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = ""
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
}
