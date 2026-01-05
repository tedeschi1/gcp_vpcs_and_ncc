resource "google_network_connectivity_hub" "us_hub" {
  name        = "global-vpc-hub"
  description = "NCC Hub to connect regional US VPCs"
  project     = var.gcp_project_id
}

resource "google_network_connectivity_spoke" "vpc_east1" {
  name     = "vpc1-east1"
  location = "global" # Spoke resource itself is global for VPC types
  hub      = google_network_connectivity_hub.us_hub.id

  linked_vpc_network {
    uri = google_compute_network.vpc1_east1.self_link
  }
}

resource "google_network_connectivity_spoke" "vpc_south1" {
  name     = "vpc1-south1"
  location = "global" # Spoke resource itself is global for VPC types
  hub      = google_network_connectivity_hub.us_hub.id

  linked_vpc_network {
    uri = google_compute_network.vpc1_south1.self_link
  }
}