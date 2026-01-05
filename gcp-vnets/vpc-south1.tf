resource "google_compute_network" "vpc1_south1" {
  name = "vpc1-south1"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"

  provider = google.us-south1
}

resource "google_compute_subnetwork" "vpc1_south1_sn1" {
  name = "vpc1-south1-subnet1"
  ip_cidr_range = "10.64.0.0/24"
  network = google_compute_network.vpc1_south1.id
  region = "us-south1"

  provider = google.us-south1
}

resource "google_compute_subnetwork" "vpc1_south1_sn2" {
  name = "vpc1-south1-subnet2"
  ip_cidr_range = "10.64.1.0/24"
  network = google_compute_network.vpc1_south1.id
  region = "us-south1"

  provider = google.us-south1
}
