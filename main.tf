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
  region  = var.region
}

variable "region" {
    type = string
    description = "mention your region. if you change region must change ami name & key-pair"
}

# Variable for AMI ID
variable "ami_map" {
  type        = map(string)
  description = "AMI ID mapping for each region"
  default = {
    "ap-southeast-1"  = "ami-08f75f3652f7d91ef"
    "us-east-2"       = "ami-092484aa52514c4fd"
    "us-west-2"       = "ami-0f59e596bfab2d9cf"
    "us-east-1"       = "ami-09041c38b0523b954"
    "us-west-1"       = "ami-0f6eefa9bcd20c6fe"
    "ap-south-1"      = "ami-0ce2b421400012344"
    "ap-southeast-2"  = "ami-073d1f71ff3f1b969"
    "ap-northeast-3"  = "ami-0c21205c1ccc847b2"
    "ap-northeast-2"  = "ami-0eddf325ed0603e40"
    "ap-northeast-1"  = "ami-03fe4f0017a618b75"
    "ca-central-1"     = "ami-0ea202e2fd68e541a"
    "eu-central-1"    = "ami-0b43a36b3d38be336"
    "eu-west-1"       = "ami-079f8d6cfabe5a428"
    "eu-west-2"       = "ami-0b6374030d6461abe"
    "eu-west-3"       = "ami-0265048c92cbd07fa"
    "eu-north-1"      = "ami-084f0bd811ba09257"
  }
}


# List of instance configurations
variable "instances" {
  type = list(object({

    name = string
    region            = string
    instance_type     = string
    storage_size      = number
    key_name          = string
    elastic_ip_needed = bool
    security_group_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

  }))
  description = "List of Splunk instances with individual configurations."
}

# Security Group Creation 
resource "aws_security_group" "splunk_sg" {
  for_each = { for idx, instance in var.instances : idx => instance }

  name_prefix = "splunk-sg-${each.value.name}"

  dynamic "ingress" {
    for_each = each.value.security_group_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Splunk instances
resource "aws_instance" "splunk_server" {
  for_each = { for idx, instance in var.instances : idx => instance }

  provider = aws
  ami           = lookup(var.ami_map, each.value.region, "")
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  vpc_security_group_ids = [aws_security_group.splunk_sg[each.key].id]
  associate_public_ip_address = each.value.elastic_ip_needed

  root_block_device {
    volume_size = each.value.storage_size
  }

  tags = {
    Name = each.value.name
  }
}


# Elastic IPs (only if needed)
resource "aws_eip" "splunk_eip" {
  for_each = { for idx, instance in var.instances : idx => instance if instance.elastic_ip_needed }

  instance = aws_instance.splunk_server[each.key].id
  vpc = true
}


# Outputs (updated for multiple instances)
output "splunk_instance_names" {
  value = {
    for idx, instance in aws_instance.splunk_server : instance.tags["Name"] => instance.id
  }
}

output "splunk_public_ips" {
  value = { 
    for idx, instance in aws_instance.splunk_server :
    instance.tags["Name"] => (lookup(aws_eip.splunk_eip, idx, null) !=null ? aws_eip.splunk_eip[idx].public_ip : instance.public_ip)
  }
}

output "splunk_private_ips" {
  value = {
    for idx, instance in aws_instance.splunk_server : 
    instance.tags["Name"] => instance.private_ip
  }
}

output "instance_states" {
  value = {
    for idx, instance in aws_instance.splunk_server : 
    instance.tags["Name"] => instance.instance_state
  }
}

output "splunk_ssh_strings" {
  value ={
    for idx, instance in aws_instance.splunk_server :
    instance.tags["Name"] => "ssh -i ${var.instances[idx].key_name}.pem ec2-user@${instance.public_dns}"
  } 
}

output "splunk_passwords" {
  value = {
    for idx, instance in aws_instance.splunk_server : 
    instance.tags["Name"]  => "SPLUNK-${instance.id}"
  } 
}

output "splunk_usernames" {
 value = {
    for idx, instance in aws_instance.splunk_server : instance.tags["Name"] => "admin"
 } 
}