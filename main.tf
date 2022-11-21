locals {
  common_labels = {
    terraform = true
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu22_docker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.large"

}

resource "aws_security_group" "sg" {
  name        = "SSH only"
  description = "SSH only acces"

  ingress {
    cidr_blocks = ["174.105.25.145/32"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_labels
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.ssh_public_key
}
