terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.14.1"
    }
  }
}

#GCP Provider Configuration
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

#GCP Provider Configuration
provider "google" {
  alias   = "us-south1"
  project = var.gcp_project_id
  region  = var.gcp_region
}
