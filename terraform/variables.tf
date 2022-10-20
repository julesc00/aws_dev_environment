variable "region" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "purpose" {
  type = string
}

variable "ec2_key" {
  type    = string
  default = "~/.ssh/dev-env-key.pub"
}

variable "host_os" {
  type = string
  description = "Use 'linux' for macOS or Linux or 'windows' for Windows."
}

locals {
  tags = {
    vpc = {
      Name = "dev_env_vpc"
    }
    subnets = {
      Name = "dev_public"
    }
    igw = {
      Name = "dev-igw"
    }
    route-public = {
      Name = "dev_public-rt"
    }
    instance = {
      Name = "dev_node"
    }
  }
}