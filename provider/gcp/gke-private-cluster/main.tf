module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.gcp_project_id
  region                     = var.gcp_region
  zones                      = var.gcp_zones
  name                       = var.gke_cluster_name
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = "pods-address"
  ip_range_services          = "services-address"
  default_max_pods_per_node  = 32
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "172.16.7.0/28"

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = var.gke_machine_type
      node_locations            = ""
      min_count                 = var.gke_min_count
      max_count                 = var.gke_max_count
      local_ssd_count           = 0 
      spot                      = false
      disk_size_gb              = var.gke_disk_size_gb
      disk_type                 = var.gke_disk_type
      image_type                = var.gke_image_type 
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = false
      service_account           = var.gke_service_account
      preemptible               = false
      initial_node_count        = var.gke_initial_node_count
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }

  depends_on = [ module.subnet ]
}