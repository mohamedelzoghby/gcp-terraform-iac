# root main.tf - Terraform configuration for GCP resources
#
# This file defines the root module that manages the deployment of the GCP infrastructure 
# for your project. It calls submodules to create network and compute resources 
# (e.g., VPCs, subnets, and VM instances) and passes variables between them. 
# Variables are sourced from external files such as terraform.tfvars, and 
# resource dependencies (e.g., VM instances depend on network creation) are handled 
# through module outputs. The root module orchestrates the overall deployment process.
#
# Modules included:
# - Network: Creates a VPC and custom subnets in the specified region.
# - Compute: Provisions virtual machine instances within the created VPC and subnet.
#
# Ensure that all variables used in this file are properly declared in either a 
# variables.tf file or in the relevant module configurations.
#

# Provider configuration (Google Cloud)
provider "google" {
  project = var.project_id
  region  = var.region
}

# Network Module
module "network" {
  source       = "./modules/network"  # Path to the network module
  network_name = var.network_name
  subnets      = var.subnets
  region       = var.region
}

# Compute Module
module "compute" {
  source                = "./modules/compute"  # Path to the compute module
  instance_name         = var.instance_name
  instance_count        = var.instance_count
  machine_type          = var.machine_type
  zone                  = var.zone
  image                 = var.image
  network_id            = module.network.network_id  # Referencing network module output
  subnetwork_id         = module.network.subnet_ids[0]  # Referring to the first subnet ID
  service_account_email = var.service_account_email
}
