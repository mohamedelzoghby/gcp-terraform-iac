# Create a Google Cloud Storage bucket with specified parameters
resource "google_storage_bucket" "storage_bucket" {
  # The unique name of the storage bucket
  name     = var.bucket_name
  
  # Location where the bucket will be created (e.g., "US", "EU")
  location = var.location
  
  # Allows bucket deletion even if it contains objects
  force_destroy = var.force_destroy

  # Set lifecycle rules to automatically delete objects after a certain age
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      # Retention period (in days) before deletion
      age        = var.retention_period
      with_state = "ANY"
    }
  }
}
