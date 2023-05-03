# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP project name
variable "gcp_project_id" {
  type        = string
  description = "GCP project name"
}
# GCP authentication file
variable "gcp_credentials" {
  type        = string
  description = "GCP authentication file"
}
variable "storage-class" {
  type        = string
  description = "The storage class of the Storage Bucket to create"
}
