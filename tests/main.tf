terraform {
  required_version = ">= 0.12"
}

resource "aws_sns_topic" "tf-aws-wam" {
  name = "${local.test_prefix}-topic"
}

module "lx-instance-centos7" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-centos7"
  AmiId                 = data.aws_ami.centos7.image_id
  AmiDistro             = "Linux"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_lx
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
  TimeoutInMinutes      = 45
}

module "lx-autoscale-centos7" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-centos7"
  AmiId                 = data.aws_ami.centos7.image_id
  AmiDistro             = "Linux"
  AppVolumeSize         = "10"
  AsgMetrics            = var.AsgMetrics
  AsgNotificationTypes  = var.AsgNotificationTypes
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_lx
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
  TimeoutInMinutes      = 45
}

module "lx-instance-oracle8" {
  source = "../modules/lx-instance"

  Name                  = "${local.test_prefix}-lx-instance-oracle8"
  AmiId                 = data.aws_ami.oracle8.image_id
  AmiDistro             = "Linux"
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_lx
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
  TimeoutInMinutes      = 45
}

module "lx-autoscale-oracle8" {
  source = "../modules/lx-autoscale"

  Name                  = "${local.test_prefix}-lx-autoscale-oracle8"
  AmiId                 = data.aws_ami.oracle8.image_id
  AmiDistro             = "Linux"
  AppVolumeSize         = "10"
  AsgMetrics            = var.AsgMetrics
  AsgNotificationTypes  = var.AsgNotificationTypes
  AsgSnsArn             = aws_sns_topic.tf-aws-wam.arn
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_lx
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.medium"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeSize        = "25"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  EnableRepos           = "epel"
  TimeoutInMinutes      = 45
}

module "win-instance-2016" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2016"
  AmiId                 = data.aws_ami.windows2016.image_id
  AppVolumeDevice       = "xvdf"
  AppVolumeEncrypted    = true
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  KmsKeyId              = local.kmskey_id
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeEncrypted   = true
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  TimeoutInMinutes      = 45
}

module "win-instance-2019" {
  source = "../modules/win-instance"

  Name                  = "${local.test_prefix}-win-instance-2019"
  AmiId                 = data.aws_ami.windows2019.image_id
  AppVolumeSize         = "10"
  CloudWatchAgentUrl    = var.cloudwatch_agent_url_win
  DisableRollback       = "true"
  EbsOptimized          = "true"
  InstanceRole          = var.instance_role
  InstanceType          = "t3.large"
  KeyPairName           = local.keypair_name
  NoPublicIp            = "false"
  OnFailureAction       = null
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetId              = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  TimeoutInMinutes      = 45
}

module "win-autoscale-2016" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2016"
  AmiId                 = data.aws_ami.windows2016.image_id
  AppVolumeDevice       = "xvdf"
  AppVolumeEncrypted    = true
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
  OnFailureAction       = null
  RootVolumeEncrypted   = true
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  TimeoutInMinutes      = 45
}

module "win-autoscale-2019" {
  source = "../modules/win-autoscale"

  Name                  = "${local.test_prefix}-win-autoscale-2019"
  AmiId                 = data.aws_ami.windows2019.image_id
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
  OnFailureAction       = null
  RootVolumeSize        = "35"
  SecurityGroupIds      = local.security_group
  SubnetIds             = var.subnet_id
  WatchmakerConfig      = var.watchmaker_config
  WatchmakerEnvironment = var.watchmaker_env
  TimeoutInMinutes      = 45
}
