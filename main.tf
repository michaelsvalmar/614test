provider "aws" {
  region = "us-east-1"
}

locals {
  aws_key = "MZ-AWS2024-KEY" # Change this to your desired AWS region
}

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = var.instance_type
  key_name      = local.aws_key

  # Solution
  user_data     = "${file("wp_install.sh")}"                # Solution - Execute install script
  security_groups=[aws_security_group.allow_http_ssh.name]  # Solution - Specify security group for HTTP access

  tags = {
    Name = "my ec2"
  }
}
