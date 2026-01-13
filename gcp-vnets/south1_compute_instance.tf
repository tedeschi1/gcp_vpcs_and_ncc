resource "google_compute_instance" "south1-us" {
  name         = var.instance_names[count.index]
  machine_type = "n2-standard-2"
  zone         = "us-south1-a"
  count        = length(var.instance_names)

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
    subnetwork = google_compute_subnetwork.vpc1_south1_sn1.name

    access_config {
      // Ephemeral public IP
    }
  }

  depends_on = [ google_compute_subnetwork.vpc1_south1_sn1 ]
}