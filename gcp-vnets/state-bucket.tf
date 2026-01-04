terraform {
  backend "gcs" {
    bucket  = TF_VARS_TF_STATE_BUCKET
    prefix  = "terraform/state"
  }
}
