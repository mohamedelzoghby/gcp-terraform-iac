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

