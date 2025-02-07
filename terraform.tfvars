region              = "us-east-1"
splunk_ami_id       = "ami-09041c38b0523b954"
instance_count      = 4
instance_names      = ["splunk-server-1","splunk-server-2","splunk-server-3","splunk-server-4", ]
key_name            = "Virginia-key"

elastic_ips_needed  = true

security_group_rules = [
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 8000, to_port = 8000, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 8089, to_port = 8089, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 554, to_port = 554, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 9997, to_port = 9997, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
]

storage_size = 30
instance_type = "t2.large"
