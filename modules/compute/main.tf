# main.tf - Compute Module
#
# This Terraform configuration defines compute resources (VM instances) 
# in the Google Cloud Platform (GCP) environment. It creates virtual 
# machines using the provided instance details such as machine type, 
# image, and number of instances.
#
# Resources:
# - google_compute_instance: Creates one or more VM instances
#
# Inputs:
# - var.instance_name: The base name of the instance(s)
# - var.instance_count: Number of instances to create
# - var.machine_type: The type of the machine (e.g., e2-medium)
# - var.image: The disk image for the instance
# - var.zone: The GCP zone where the instances will be created
# - var.network_id: The ID of the VPC network
# - var.subnetwork_id: The ID of the subnetwork where instances are placed
# - var.service_account_email: The service account to use with the instance
#
# Outputs:
# - instance_ids: The IDs of the created instances
# - instance_ips: The internal IPs of the created instances

# main.tf - Compute Module
#
# Variables declared at the root level

# Resource to create VM instances
resource "google_compute_instance" "vm_instance" {
  count        = var.instance_count
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnetwork_id
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

