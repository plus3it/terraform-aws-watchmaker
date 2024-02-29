# get the default vpc
data "aws_vpc" "this" {
  default = "true"
}

data "aws_ami" "centos7" {
  most_recent = true
  owners      = ["174003430611"]

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

data "aws_ami" "oracle8" {
  most_recent = true
  owners      = ["174003430611"]

  filter {
    name   = "name"
    values = ["*spel-minimal-ol-8*"]
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

data "aws_ami" "windows2019" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}
