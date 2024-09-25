# variables.tf - Centralized Variables

# GCP Project ID
variable "project_id" {
  description = "The GCP project ID where resources will be created"
  type        = string
}

# Region for resource deployment
variable "region" {
  description = "The region where all resources will be deployed"
  type        = string
  default     = "us-central1"
}

# Network Variables
variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnets" {
  description = "A list of subnets to create, each with a name and CIDR block"
  type = list(object({
    name = string
    cidr = string
  }))
}

# Compute Variables
variable "instance_name" {
  description = "The base name for the VM instance(s)"
  type        = string
}

variable "instance_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The type of machine to create for the VM instance(s) (e.g., e2-medium)"
  type        = string
}

variable "image" {
  description = "The disk image to use for the VM instances"
  type        = string
}

variable "zone" {
  description = "The GCP zone where the VM instance(s) will be deployed"
  type        = string
}

# Network IDs to assign to the VM
variable "network_id" {
  description = "The ID of the VPC network to attach to the VM instances"
  type        = string
}

variable "subnetwork_id" {
  description = "The ID of the subnet to attach to the VM instances"
  type        = string
}

# Service Account for VM instances
variable "service_account_email" {
  description = "The email of the service account to associate with the VM instances"
  type        = string
}
