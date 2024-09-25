# Network Variables
variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnets" {
  description = "List of subnets with CIDR blocks"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}
