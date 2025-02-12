region = "us-east-1"


instance_commands = {
  "ClusterManager" =[
    "sleep 40",
    "sudo su - splunk",
    "/opt/splunk/bin/splunk edit cluster-config -mode manager -replication_factor 3 -search_factor 2 -secret YOUR_KEY -cluster_label cluster1 -auth admin:admin123",
    "/opt/splunk/bin/splunk restart"
  ],
  "idx-1" = [
    "sudo su - splunk",
    "/opt/splunk/bin/splunk edit cluster-config -mode peer -manager_uri https://YOUR_CLUSTER_MANAGER_IP:8089 -replication_port 9887 -secret YOUR_KEY -auth admin:admin123",
    "/opt/splunk/bin/splunk restart"
  ]
}

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
  },
  {
    name              = "idx-3"
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
    name              = "idx-4"
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
    name              = "idx-5"
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
    name              = "idx-6"
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
  },
  {
    name              = "idx-7"
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
  },
  {
    name              = "idx-8"
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
  },
  {
    name              = "idx-9"
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
  },
  {
    name              = "idx-10"
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
