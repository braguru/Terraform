variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t3.medium"
}

variable "tag" {
  type        = string
  description = "value"
}

variable "ubuntu_ami_id" {
  type        = string
  description = "The ID of the AMI to use for the EC2 instance"
  default     = "ami-0866a3c8686eaeeba"
}

variable "key_pair_name" {
  description = "The name of the existing EC2 key pair"
  type        = string
  default     = "ghtraining"
}

# variable "vpc_id" {
#   description = "The ID of the VPC"
#   type        = string

# }

variable "aws_security_group" {
  description = "The ID of the security group"
  type        = list(string)
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
  default = "value"
}

variable "availability_zone" {
  description = "The availability zone of the EC2 instance"
  type        = string
  default     = "eu-west-1a"
  
}