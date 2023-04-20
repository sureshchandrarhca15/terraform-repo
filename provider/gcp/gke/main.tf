module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id 
  region                     = var.gcp_region
  zones                      = var.gcp_zones
  name                       = var.gke_cluster_name
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  horizontal_pod_autoscaling = true  
  network_policy             = false
  create_service_account     = false
  remove_default_node_pool   = true
  monitoring_service         = "monitoring.googleapis.com/kubernetes"
  logging_service            = "logging.googleapis.com/kubernetes"
  filestore_csi_driver       = true

  node_pools = [
    {
      name                      = var.gke_nodepool_name
      machine_type              = var.gke_machine_type
      min_count                 = var.gke_min_count
      max_count                 = var.gke_max_count
      disk_size_gb              = var.gke_disk_size_gb
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.gke_service_account
      preemptible               = false
      initial_node_count        = var.gke_initial_node_count
    },
  ]

  node_pools_oauth_scopes = {

    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
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
      node-pool-metadata-custom-value = var.gke_nodepool_name
    }
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}

// Create a Kubernetes namespace for each name in the list
resource "kubernetes_namespace" "namespaces" {
  for_each = { for name in var.gke_namespace_names : name => name }

  metadata {
    name = each.value
  }

  #depends_on = [module.gke]
}
