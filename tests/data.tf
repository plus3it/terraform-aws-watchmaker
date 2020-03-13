# get the default vpc
data "aws_vpc" "this" {
  default = "true"
}

data "aws_ami" "centos6" {
  most_recent = true
  owners      = ["701759196663"]

  filter {
    name   = "name"
    values = ["*spel-minimal-centos-6*"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "centos7" {
  most_recent = true
  owners      = ["701759196663"]

  filter {
    name   = "name"
    values = ["*spel-minimal-centos-7*"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "windows2012R2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2012-R2_RTM-English-64Bit-Base*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "windows2016" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}
