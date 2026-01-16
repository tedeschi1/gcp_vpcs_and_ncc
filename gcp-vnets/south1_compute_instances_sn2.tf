resource "google_compute_instance" "south1-us-sn2" {
  name         = each.key
  machine_type = each.value.type
  zone         = each.value.zone
  for_each     = var.server_config

  tags = ["southus", "allow-ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = google_compute_network.vpc1_south1.name
    subnetwork = google_compute_subnetwork.vpc1_south1_sn2.name

    access_config {
      // Ephemeral public IP
    }
  }

  depends_on = [ google_compute_subnetwork.vpc1_south1_sn2 ]
}

output "south1_instance_ips" {
  description = "A map of instance names to their public IP addresses"
  value = {
    for p in google_compute_instance.east1-us : p.name => p.network_interface[0].access_config[0].nat_ip
  }
}