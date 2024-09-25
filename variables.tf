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

# Declare the variables for the network module
variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnets" {
  description = "A list of subnets to create"
  type = list(object({
    name = string
    cidr = string
  }))
}

# Declare the variables for the compute module
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
  description = "The disk image to use for the VM instance(s)"
  type        = string
}

variable "zone" {
  description = "The zone where the VM instance(s) will be deployed"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to associate with VM instances"
  type        = string
}

