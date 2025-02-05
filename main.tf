terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "splunk_serverr" {
  ami           = "ami-07a79552200256856"
  instance_type = "t2.medium"
  key_name = var.key_name

  tags = {
    Name = "splunk-server"
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
  value = "ssh -i ${var.key_name}.pem ec2-user@${aws_instance.splunk_serverr.public_dns}"
}


