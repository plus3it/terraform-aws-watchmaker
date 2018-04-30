resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "this" {
  key_name   = "${local.test_prefix}-aws-terraform-wam-test"
  public_key = "${tls_private_key.this.public_key_openssh}"
}

resource "aws_security_group" "this" {
  name   = "${local.test_prefix}-aws-terraform-wam-test"
  vpc_id = "${data.aws_subnet.selected.vpc_id}"

  tags {
    Name = "${local.test_prefix}-terraform-aws-wam"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
