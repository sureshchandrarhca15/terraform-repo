module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.2"
  project_id = var.gcp_project_id
  region     = var.gcp_region
  name       = var.gke_cloudnat_name
  router     = var.gke_cloudnat_router_name
  create_router = true
  network    = var.gke_network
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [ module.gke ]
}