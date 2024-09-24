# network_variables.tf - Network Module
#
# This file defines the input variables for the network module.
# It includes variables for the VPC name, the list of subnets (with their
# respective names and CIDR blocks), and the region where resources will be deployed.

# The name of the VPC network
variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

# List of subnets with names and CIDR blocks
variable "subnets" {
  description = "A list of subnets to create, each with a name and CIDR block"
  type = list(object({
    name = string  # Name of the subnet
    cidr = string  # CIDR block for the subnet
  }))
}

# The region where the resources will be deployed
variable "region" {
  description = "The region to deploy the resources in"
  type        = string
}
