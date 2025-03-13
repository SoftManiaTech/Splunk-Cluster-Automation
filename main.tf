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
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
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

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("${each.value.key_name}.pem")
      host = self.public_ip
    }

    inline = [
       "echo '${var.ssh_public_key}' >> ~/.ssh/authorized_keys"
    ]
  }
  
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [aws_instance.splunk_server, aws_eip.splunk_eip]
  create_duration = "10s"
}

resource "local_file" "ansible_inventory" {
  depends_on = [time_sleep.wait_10_seconds]
  filename   = "inventory.ini"
  
  content    = join("\n", flatten([
    "[ClusterManager]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "ClusterManager"],

    "[indexers]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "idx1"],
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "idx2"],
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "idx3"],

    "[SH1]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH1"],

    "[SH2]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH2"],

    "[SH3]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH3"],

    "[search_heads]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH1"],
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH2"],
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "SH3"],

    "[Deployment_Server]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "Deployment-Server"],

    "[Management_server]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "Management_server"],

    "[Deployer]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "Deployer"],

    "[IFs]",
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "IF1"],
    [for idx, instance in var.instances : "${instance.name} ansible_host=${lookup(aws_eip.splunk_eip, idx, { public_ip = aws_instance.splunk_server[idx].public_ip }).public_ip} instance_id=${aws_instance.splunk_server[idx].id} ansible_user=ec2-user" if instance.name == "IF2"],
  ]))
}



resource "local_file" "ansible_group_vars" {
  filename = "group_vars/all.yml"

  content = templatefile("${path.module}/group_vars_template.yml", {
    cluster_manager    = [for instance in aws_instance.splunk_server : { private_ip = instance.private_ip, instance_id = instance.id } if instance.tags["Name"] == "ClusterManager"]
    indexers          = { for instance in aws_instance.splunk_server : instance.tags["Name"] => { private_ip = instance.private_ip, instance_id = instance.id } if startswith(instance.tags["Name"], "idx") }
    search_heads      = { for instance in aws_instance.splunk_server : instance.tags["Name"] => { private_ip = instance.private_ip, instance_id = instance.id } if startswith(instance.tags["Name"], "SH") }
    deployment_server = [for instance in aws_instance.splunk_server : { private_ip = instance.private_ip, instance_id = instance.id } if instance.tags["Name"] == "Deployment-Server"]
    Management_server    = [for instance in aws_instance.splunk_server : { private_ip = instance.private_ip, instance_id = instance.id } if instance.tags["Name"] == "Management_server"]
    deployer          = [for instance in aws_instance.splunk_server : { private_ip = instance.private_ip, instance_id = instance.id } if instance.tags["Name"] == "Deployer"]
    ifs              = { for instance in aws_instance.splunk_server : instance.tags["Name"] => { private_ip = instance.private_ip, instance_id = instance.id } if startswith(instance.tags["Name"], "IF") }
    splunk_admin_password = "admin123"
  })
}

# Elastic IPs (only if needed)
resource "aws_eip" "splunk_eip" {
  for_each = { for idx, instance in var.instances : idx => instance if instance.elastic_ip_needed }

  instance = aws_instance.splunk_server[each.key].id
  vpc = true
}
