# main.tf - Storage Module
#
# This Terraform configuration defines the infrastructure for creating a Google Cloud Storage bucket.
# It includes parameters for the bucket name, location, and lifecycle rules, such as automatic 
# object deletion after a retention period. The configuration allows for forced deletion of the 
# bucket even if it contains objects. The module outputs the bucket’s name and URL.
#
# Resources:
# - google_storage_bucket: Defines the storage bucket and lifecycle rules.
#
# Inputs:
# - bucket_name, location, force_destroy, retention_period, project_id
#
# Outputs:
# - bucket_name, bucket_url

resource "google_storage_bucket" "storage_bucket" {
  name          = var.bucket_name
  location      = var.location
  force_destroy = var.force_destroy

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age        = var.retention_period
      with_state = "ANY"
    }
  }
}
