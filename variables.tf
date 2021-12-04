variable infra_env {
    type = string
    description = "infrastructure environment"
    default = "dev"
}
 
variable infra_role {
  type = string
  description = "infrastructure purpose"
  default = "dev"
}
 
variable instance_size {
    type = string
    description = "ec2 web server size"
    default = "t3.small"
}
 
variable instance_ami {
    type = string
    description = "Server image to use"
    default = "ami-002068ed284fb165b"
}
 
variable instance_root_device_size {
    type = number
    description = "Root bock device size in GB"
    default = 8
}

variable "public_subnet_numbers" {
  type = map(number)
 
  description = "Map of AZ to a number that should be used for public subnets"
 
  default = {
    "us-east-2a" = 1
    "us-east-2b" = 2
    "us-east-2c" = 3
  }
}
 
variable "private_subnet_numbers" {
  type = map(number)
 
  description = "Map of AZ to a number that should be used for private subnets"
 
  default = {
    "us-east-2a" = 4
    "us-east-2b" = 5
    "us-east-2c" = 6
  }
}
 
variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "10.0.0.0/16"
}
 