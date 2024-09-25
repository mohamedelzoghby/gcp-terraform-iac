# variables.tf - Storage Module Variables
#
# Inputs used to configure the storage bucket, including bucket name, location, and lifecycle rules.

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

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
