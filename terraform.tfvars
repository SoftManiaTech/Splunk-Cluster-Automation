region = "us-east-1"

instances = [
  {
    name              = "ClusterManager"
    region            = "us-east-1"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform"
    elastic_ip_needed = true
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
         { from_port = 554, to_port = 554, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }, 
  {
    name              = "idx-1"
    region            = "us-east-1"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform"
    elastic_ip_needed = true
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-2"
    region            = "us-east-1"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "terraform"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
]
