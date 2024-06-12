variable "project" {
  description = "The project ID to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
  default     = "us-central1"
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials file"
}
