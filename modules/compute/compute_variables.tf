# compute_variables.tf - Compute Module
#
# This file defines the input variables for the compute module, which
# creates virtual machine instances in Google Cloud Platform (GCP).
# The variables include details like instance name, count, machine type,
# disk image, zone, network, and service account details.

# The base name for the VM instance(s)
variable "instance_name" {
  description = "The base name for the VM instance(s)"
  type        = string
}

# Number of instances to create
variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1  # Default to creating 1 instance
}

# The machine type for the VM instance(s)
variable "machine_type" {
  description = "The type of machine to create (e.g., e2-medium)"
  type        = string
}

# The disk image to use for the boot disk
variable "image" {
  description = "The disk image to use for the VM boot disk"
  type        = string
}

# The zone where the VM instance(s) will be created
variable "zone" {
  description = "The GCP zone where the instance(s) will be deployed"
  type        = string
}

# The ID of the VPC network
variable "network_id" {
  description = "The ID of the VPC network"
  type        = string
}

# The ID of the subnetwork where the instances will be placed
variable "subnetwork_id" {
  description = "The ID of the subnetwork"
  type        = string
}

# The service account email to use for the VM instance(s)
variable "service_account_email" {
  description = "The email of the service account to associate with the instance"
  type        = string
}
