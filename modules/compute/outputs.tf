# outputs.tf - Compute Module
#
# This file defines the outputs from the compute module, which provides
# details about the created VM instances. The outputs include the instance
# IDs and the internal IP addresses of the instances.
#
# Outputs:
# - instance_ids: List of VM instance IDs
# - instance_ips: List of internal IP addresses of the VM instances

# Output the IDs of the created VM instances
output "instance_ids" {
  description = "The IDs of the VM instances"
  value       = google_compute_instance.vm_instance[*].id
}

# Output the internal IP addresses of the created VM instances
output "instance_ips" {
  description = "The internal IP addresses of the VM instances"
  value       = google_compute_instance.vm_instance[*].network_interface[0].network_ip
}
