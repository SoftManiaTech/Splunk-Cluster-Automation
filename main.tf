terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "splunk_serverr" {
  ami           = "ami-08f75f3652f7d91ef"
  instance_type = "t2.medium"
  associate_public_ip_address = true
  key_name = var.key_name
  vpc_security_group_ids = ["${aws_security_group.splunk_serverr.id}"]
  tags = {
    Name = "splunk-server"
  }

}

resource "aws_eip" "splunk_eip" {
  instance = aws_instance.splunk_serverr.id
}


resource "aws_security_group" "splunk_serverr" {
  name_prefix = "splunk-sg"


  ingress {
    from_port = 22
    to_port  = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port = 8000
    to_port  = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8089
    to_port  = 8089
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 554
    to_port  = 554
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port  = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9997
    to_port  = 9997
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


variable "key_name" {
  type = string
  
}



output "Splunk_Instance_Name" {
  value = aws_instance.splunk_serverr.tags["Name"]
}
output "Splunk_Public_IP" {
  value = aws_instance.splunk_serverr.public_ip
}
output "Splunk_Private_IP" {
  value = aws_instance.splunk_serverr.private_ip
}
output "Splunk_Key_name" {
  value = aws_instance.splunk_serverr.key_name
}
output "Instance_State" {
  value = aws_instance.splunk_serverr.instance_state
}
output "Splunk_SSH_String" {
  value = "ssh -i ${var.key_name}.pem ec2-user@${aws_eip.splunk_eip.public_dns}"
}


