variable "gcp_credentials" {
  type          = string
  description   = "Location of service account credentials file"
}

variable "gcp_project_id" {
  type          = string
  description   = "GCP Project ID"
}

variable "gcp_region" {
  type          = string
  description   = "GCP region"
}


variable "gcp_zones" {
  type          = list(string)
  description   = "GCP zones"
}

variable "gke_cluster_name" {
  type          = string
  description   = "GKE cluster name"
}

variable "gke_machine_type" {
  type          = string
  description   = "GKE machine type name"
}

variable "gke_min_count" {
  type          = number
  description   = "Minimum node count in GKE cluster"
}

variable "gke_nodepool_name" {
  type          = string
  description   = "GKE nodepool name"
}


variable "gke_max_count" {
  type          = number
  description   = "Maximum node count in GKE cluster"
}

variable "gke_disk_size_gb" {
  type          = number
  description   = "Disk capacity of node in GKE cluster"
}

variable "gke_initial_node_count" {
  type          = number 
  description   = "Initial node count in GKE"
}

variable "gke_network" {
  type          = string 
  description   = "The VPC network to host the cluster in"
}

variable "gke_subnetwork" {
  type          = string
  description   = "The subnetwork to host the cluster in"
}

variable "gke_service_account" {
  type          = string
  description   = "GKE service account name"
}

variable "gke_namespace_names" {
  type    = list(string)
  description   = "Kubernetes namespace names"
}
