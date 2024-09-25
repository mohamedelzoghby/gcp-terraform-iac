# main.tf - Network Module
#
# This Terraform configuration creates the core network infrastructure
# for the Google Cloud Platform (GCP) environment. It defines a Virtual Private Cloud (VPC) and custom subnets. 
# The module accepts a list of subnets with their respective names and CIDR blocks, and deploys them in the specified region.
#
# Resources:
# - google_compute_network: Creates a VPC
# - google_compute_subnetwork: Creates subnets within the VPC
#
# Inputs:
# - var.network_name: Name of the VPC
# - var.subnets: List of subnets (name, CIDR)
# - var.region: GCP region where resources will be created
#
# Outputs:
# - network_id: The ID of the VPC
# - subnet_ids: List of subnet IDs

# main.tf - Network Module


# Resource to create a VPC network
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

# Resource to create subnets
resource "google_compute_subnetwork" "subnetwork" {
  count = length(var.subnets)
  
  name       = var.subnets[count.index]["name"]
  network    = google_compute_network.vpc_network.id
  ip_cidr_range = var.subnets[count.index]["cidr"]
  region     = var.region
}
