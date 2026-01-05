variable "gcp_project_id" {
  type = string
  default = "single-quanta-461820-s0"
}

variable "gcp_region" {
  type = string
  default = "us-central1"
}

# variable "gcp_credentials_file" {
#   type = string
#   default = "C:/Users/Michael Tedeschi/Downloads/csp-gcp-mtedeschi-b944a061f93c.json"
# }

variable "vpc_east_name" {
  type        = string
  description = "The name of the VPC in the east region"
}
