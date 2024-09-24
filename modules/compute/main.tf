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

resource "google_compute_instance" "vm_instance" {
  # Creates multiple instances based on the count
  count        = var.instance_count

  # Instance properties
  name         = "${var.instance_name}-${count.index}"  # Unique instance name
  machine_type = var.machine_type
  zone         = var.zone

  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = var.image  # The disk image to use (e.g., debian-cloud/debian-10)
    }
  }

  # Network interface and subnetwork details
  network_interface {
    network    = var.network_id
    subnetwork = var.subnetwork_id
  }

  # Assigning a service account to the instance
  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
