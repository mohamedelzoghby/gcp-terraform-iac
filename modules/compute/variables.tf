# Compute Variables
variable "instance_name" {
  description = "Base name for the VM instance"
  type        = string
}

variable "instance_count" {
  description = "Number of VM instances"
  type        = number
}

variable "machine_type" {
  description = "The machine type for VM instances"
  type        = string
}

variable "image" {
  description = "The image to use for VM instances"
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM instance(s) will be deployed"
  type        = string
}

variable "network_id" {
  description = "The network ID to attach the VM to"
  type        = string
}

variable "subnetwork_id" {
  description = "The subnet ID to attach the VM to"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to associate with VM instances"
  type        = string
}
