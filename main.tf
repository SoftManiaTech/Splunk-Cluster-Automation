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
variable "splunk_ami_id" {
  type        = string
  description = "AMI ID for Splunk Enterprise"
}


# Variable definitions for flexibility
variable "instance_count" {
  type = number
  description = "Number of Splunk instances to create"
  default = 1 # Default to 1 if not specified
}

variable "instance_names" {
  type = list(string)
  description = "List of instance names (must match instance_count)"
  default = ["splunk-server-1"]
}


variable "key_name" {
  type = string
  description = "Name of the SSH key pair"
}

variable "elastic_ips_needed" {
  type = bool
  description = "Whether to associate Elastic IPs"
  default = true
}

variable "security_group_rules" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
  }))
  description = "List of security group ingress rules"
  default = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 554, to_port = 554, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  ]
}

variable "storage_size" {
  type = number
  description = "Size of the root volume in GB"
  default = 30 
}


# Security group
resource "aws_security_group" "splunk_server_sg" {
  count = var.instance_count
  name_prefix = "splunk-sg-"

  dynamic "ingress" {
    for_each = var.security_group_rules
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

variable "instance_type" {
    type = string
    description = "Enter the instance type for Splunk servers (Default: t2.medium)"
    default = "t2.medium"
}


# Splunk instances
resource "aws_instance" "splunk_server" {
  count = var.instance_count
  ami           = var.splunk_ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.splunk_server_sg[count.index].id]
  associate_public_ip_address = !var.elastic_ips_needed

  root_block_device {
    volume_size = var.storage_size
  }

  tags = {
    Name = var.instance_names[count.index] # Use the provided names list
  }
}


# Elastic IPs (only if needed)
resource "aws_eip" "splunk_eip" {
  count = var.elastic_ips_needed ? var.instance_count : 0
  instance = aws_instance.splunk_server[count.index].id
  vpc = true
}


# Outputs (updated for multiple instances)
output "splunk_instance_names" {
  value = aws_instance.splunk_server[*].tags["Name"]
}

output "splunk_public_ips" {
  value = { 
    for idx, instance in aws_instance.splunk_server[*] :
    instance.tags["Name"] => var.elastic_ips_needed ? aws_eip.splunk_eip[idx].public_ip : instance.public_ip
  }
}

output "splunk_private_ips" {
  value = {
    for idx, instance in aws_instance.splunk_server[*] : 
    instance.tags["Name"] => instance.private_ip
  }
}

output "instance_states" {
  value = {
    for idx, instance in aws_instance.splunk_server[*] : 
    instance.tags["Name"] => instance.instance_state
  }
}

output "splunk_ssh_strings" {
  value ={
    for idx, instance in aws_instance.splunk_server[*] :
    instance.tags["Name"] => "ssh -i ${var.key_name}.pem ec2-user@${instance.public_dns}"
  } 
}

output "splunk_passwords" {
  value = {
    for idx, instance in aws_instance.splunk_server[*] : 
    instance.tags["Name"]  => "SPLUNK-${instance.id}"
  } 
}

output "splunk_usernames" {
 value = {
    for idx, instance in aws_instance.splunk_server[*] : instance.tags["Name"] => "admin"
 } 
}