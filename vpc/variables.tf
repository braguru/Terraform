variable "vpc_name" {
  description = "value of the vpc name"
  type        = string
  default     = "internal-projects-vpc"
}

variable "cidr_block" {
  description = "value of the cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
