aws_access_key = "AKIA3T2G2QBITKYKGTP3"
aws_secret_key = "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"

region = "us-east-2"

splunk_license_url = "https://drive.google.com/uc?id=1di5R8oHXKXEb9EUAK_mcH7a4-8XP87Fi&export=download"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKXMB06/R9H7fB8EJ+FcOtjIZSMRyv45hnWWbNAgpBDl1zVwm9SL2U8QRfcMafTd2M+jJJ1kKOXisZ5PsfV3x1psbfo/u9H6ETiA8hYp/Mh3o9lddZH8Z3Q5EbcNEcFK4XPPeHcVOAyldOgaJncHSYgXI5/dKrfuwz1sTcbI9K3Hvvqep4cdjAL5CRHJYXusSOieI1LhcmhNEZkJ+zjYBs8LGEe6lqUoBcu/Jxfxsf8UekeiLrMq/srjPXPU47X1YCKRb3N0AliBIUIvdaTBgwd3GMvX2ZMNmyVqtAc+lEV0oxYHwAkx9qtorwHE7Cuyjl0HCNHk6ef9kV34JyY3BEU9b/Q85bJ5Z07Y69cPw1ZzE5g/db4PoGhptRpHZ8xj9vg9c8f/kMK8UlV/5FcWTbGxfvqTVwsQ+K8Lg3njRB+qaH/ADCyqm7eZ/Iynt/my40Aa4Gvnr01YQ9A0bWJLbCSXGoUbJPkja2phWwqO3jZ4t4kahjcavMvLJIaEXW+es= wsl@Kaliyappan"

instances = [
  {
    name              = "ClusterManager"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = true
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  }, 
  {
    name              = "idx1"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "idx2"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "idx3"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "Deployer"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "SH1"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "SH2"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "SH3"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "Deployment-Server"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "Management_server"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "IF1"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  },
  {
    name              = "IF2"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform-Ohio"
    elastic_ip_needed = false
    security_group_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8088, to_port = 8088, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8065, to_port = 8065, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8181, to_port = 8181, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9887, to_port = 9887, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 8191, to_port = 8191, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 514, to_port = 514, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    { from_port = 9777, to_port = 9777, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
    ]
  }
]

