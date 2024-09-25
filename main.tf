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
# - Storage: Provisions storage buckets
#
# Ensure that all variables used in this file are properly declared in either a 
# variables.tf file or in the relevant module configurations.
#

# Calling the Network Module
module "network" {
  source       = "./modules/network"
  network_name = var.network_name
  subnets      = var.subnets
  region       = var.region
}

# Calling the Compute Module
module "compute" {
  source                = "./modules/compute"
  instance_name         = var.instance_name
  instance_count        = var.instance_count
  machine_type          = var.machine_type
  zone                  = var.zone
  image                 = var.image
  network_id            = module.network.network_id
  subnetwork_id         = module.network.subnet_ids[0]
  service_account_email = var.service_account_email
}

# Calling the Storage Module
module "storage" {
  source          = "./modules/storage"
  bucket_name     = var.bucket_name
  location        = var.location
  force_destroy   = var.force_destroy
  retention_period = var.retention_period
  project_id      = var.project_id
}
