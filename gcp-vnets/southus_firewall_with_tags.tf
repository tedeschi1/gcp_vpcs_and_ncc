resource "google_compute_firewall" "vpc1_southus1_rules" {
  project     = var.gcp_project_id
  name        = "us-south1-firewall-rules"
  network     = google_compute_network.vpc1_south1.name
  description = "Creates firewall rule targeting tagged instances"
  direction   = "INGRESS"
  priority    = 1000

  #Allow in-browser SSH
  source_ranges = [var.iap_source_range, var.south1_internal_range]

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  target_tags = ["allow-ssh"]

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  depends_on = [google_compute_network.vpc1_south1]
}