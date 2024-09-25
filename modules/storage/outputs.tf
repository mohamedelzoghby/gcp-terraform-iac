# outputs.tf - Storage Module Outputs
#
# Outputs for referencing the bucket's name and URL after creation.

output "bucket_name" {
  description = "The name of the storage bucket"
  value       = google_storage_bucket.storage_bucket.name
}

output "bucket_url" {
  description = "The URL of the storage bucket"
  value       = google_storage_bucket.storage_bucket.url
}
