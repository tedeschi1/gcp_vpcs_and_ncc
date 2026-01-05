terraform {
  backend "gcs" {
    bucket  = "terraform-state-bucket-750000"
    prefix  = "terraform/state"
  }
}
