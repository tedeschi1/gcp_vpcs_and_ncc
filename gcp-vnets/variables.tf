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

#Used in south1 compute insance configuration
variable "instance_names" {
  type    = list(string)
  default = ["web-server", "app-server", "db-server"]
}

#Used in south1 sn2 compute instance configuration
variable "server_config" {
  default = {
    "web-prod" = { type = "n2-standard-2", zone = "us-south1-b" }
    "db-prod"  = { type = "n2-standard-2", zone = "us-south1-c" }
  }
}
