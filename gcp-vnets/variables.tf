variable "gcp_project_id" {
  type = string
  description = "The GCP Project ID"
}

variable "gcp_region" {
  type = string
  default = "us-central1"
}

variable "vpc_east_name" {
  type        = string
  description = "The name of the VPC in the east region"
}

variable "tf_state_bucket_name" {
  type        = string
  description = "The name of the VPC in the east region"
}
