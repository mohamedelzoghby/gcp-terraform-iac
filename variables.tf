# General variables
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
}

# Network module variables
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

# Compute module variables
variable "instance_name" {
  description = "Base name for the VM instances"
  type        = string
}

variable "instance_count" {
  description = "Number of VM instances to create"
  type        = number
}

variable "machine_type" {
  description = "The machine type for VM instances"
  type        = string
}

variable "zone" {
  description = "The zone where the VM instance(s) will be deployed"
  type        = string
}

variable "image" {
  description = "The image to use for VM instances"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to associate with VM instances"
  type        = string
}

# Storage module variables
variable "bucket_name" {
  description = "The name of the storage bucket"
  type        = string
}

variable "location" {
  description = "The location of the storage bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force bucket deletion, even if it contains objects"
  type        = bool
  default     = false
}

variable "retention_period" {
  description = "How long to retain objects in the bucket (in days)"
  type        = number
}
