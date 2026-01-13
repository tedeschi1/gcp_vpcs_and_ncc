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

variable "instance_names" {
  type    = list(string)
  default = ["web-server", "app-server", "db-server"]
}
