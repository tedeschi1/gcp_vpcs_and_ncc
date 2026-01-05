resource "google_compute_firewall" "vpc1_southus1_rules" {
  project     = var.gcp_project_id
  name        = "us-south1-firewall-rules"
  network     = "vpc1-south1"
  description = "Creates firewall rule targeting tagged instances"
  direction   = "INGRESS"
  priority    = 1000

  #Allow in-browser SSH
  source_ranges = ["35.235.240.0/20", "10.64.0.0/21"]

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