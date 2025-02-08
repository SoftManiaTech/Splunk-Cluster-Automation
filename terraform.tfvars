region = "us-east-2"

instances = [
  {
    name              = "ClusterManager"
    region            = "us-east-2"
    instance_type     = "t2.xlarge"
    storage_size      = 50
    key_name          = "fastapi"
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
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = true
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-2"
    region            = "us-east-2"
    instance_type     = "t2.large"
    storage_size      = 100
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-3"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
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
    name              = "idx-4"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = true
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-5"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = true
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-6"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-7"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-8"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-9"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name              = "idx-10"
    region            = "us-east-2"
    instance_type     = "t2.medium"
    storage_size      = 30
    key_name          = "fastapi"
    elastic_ip_needed = false
    security_group_rules = [
        { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
        { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
]
