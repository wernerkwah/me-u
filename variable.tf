variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs."
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_type" {
  description = "The type of instance to use."
  default     = "t3.medium"
}

variable "key_name" {
  description = "The name of the SSH key pair."
  default     = "ansible-key"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}
