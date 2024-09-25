# outputs.tf - Network Module
#
# This file defines the outputs from the network module.
# It provides the network ID of the created VPC and the list of subnet IDs.
# These outputs are useful for other parts of the infrastructure that
# need to reference the created VPC and subnets.

# Output the ID of the VPC network
output "network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpc_network.id
}

# Output the list of Subnet IDs
output "subnet_ids" {
  description = "List of Subnet IDs"
  value       = google_compute_subnetwork.subnetwork[*].id
}

