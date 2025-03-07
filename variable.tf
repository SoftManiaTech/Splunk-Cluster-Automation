
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

variable "ssh_public_key" {
  description = "SSH public key for authentication"
  type        = string
}

