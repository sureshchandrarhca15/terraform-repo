terraform {
  backend "etcdv3" {
    endpoints = ["192.168.1.56:2379"]
    lock      = true
    prefix    = "gke-private-cluster/terraform-state/" 
  }
}


data "google_client_config" "default" {}

provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
}


provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}