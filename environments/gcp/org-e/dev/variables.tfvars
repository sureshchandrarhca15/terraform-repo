gcp_credentials   		    = "../../../../dataloop-candidate-environment-72b3c23e58b7.json"
gcp_project_id    		    = "dataloop-candidate-environment"
gcp_region        		    = "us-west1"
gcp_zones	  		          = ["us-west1-a", "us-west1-b", "us-west1-c"]
gke_cluster_name  		    = "org-e-dev-gke-72b3c23e58b7"
gke_nodepool_name         = "org-e-dev-node-pool"
gke_machine_type		      = "n1-standard-1"
gke_min_count			        = 1
gke_max_count			        = 2
gke_disk_size_gb		      = 100
gke_initial_node_count    = 1
gke_network	  		        = "default"
gke_subnetwork	  		    = "default"
gke_service_account		    = "terraform@dataloop-candidate-environment.iam.gserviceaccount.com"
gke_namespace_names       = ["services", "monitoring"]
