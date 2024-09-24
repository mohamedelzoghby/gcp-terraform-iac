# gcp-terraform-iac
This repository contains a Terraform-based project for deploying infrastructure on Google Cloud Platform (GCP). It includes modular code for VPCs, subnets, compute resources, and storage. Supports multiple environments (dev/prod) and follows best practices for scalable Infrastructure as Code (IaC).

Overview
This repository contains a Terraform-based project to deploy infrastructure on Google Cloud Platform (GCP). It includes reusable modules for key resources like VPC networks, subnets, compute instances, and storage, supporting multiple environments (e.g., dev and prod). The project adheres to best practices for Infrastructure as Code (IaC).

Features
Modular Architecture: Reusable Terraform modules for VPC, compute, and storage.
Multi-Environment Setup: Configurations for both development and production environments.
Remote State Management: Terraform state stored in Google Cloud Storage (GCS).
Scalability: Easily extend or modify the infrastructure by adding new modules.

Prerequisites
Terraform installed (v1.0 or higher).
A Google Cloud account and project.
A service account with proper permissions and a credentials file.
Google Cloud SDK installed for managing your GCP environment.

Project Structur
📦 gcp-terraform-iac
├── modules
│   ├── network
│   ├── compute
│   └── storage
├── environments
│   ├── dev
│   └── prod
├── scripts
├── provider.tf
├── versions.tf
└── README.md

modules/: Contains reusable Terraform modules for network, compute, and storage.
environments/: Environment-specific configurations for dev and prod.
scripts/: Helper scripts for infrastructure setup (e.g., creating GCS buckets for state storage).
provider.tf: Defines the GCP provider and authentication details.
versions.tf: Specifies required versions for Terraform and the GCP provider.
