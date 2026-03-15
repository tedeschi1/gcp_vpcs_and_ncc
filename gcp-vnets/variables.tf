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

variable "vpc_south_name" {
  type        = string
  description = "The name of the VPC in the south region"
  default     = "vpc1-south1"
}

variable "iap_source_range" {
  type        = string
  description = "IAP source range for in-browser SSH access"
  default     = "35.235.240.0/20"
}

variable "east1_internal_range" {
  type        = string
  description = "Internal source range for east1 firewall (south1 subnet CIDR)"
  default     = "10.64.0.0/21"
}

variable "south1_internal_range" {
  type        = string
  description = "Internal source range for south1 firewall (east1 subnet CIDR)"
  default     = "10.0.0.0/21"
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
