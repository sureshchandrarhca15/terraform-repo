gcp_credentials   		    = "../../../../../river-formula-385606-56175784614c.json" 
gcp_project_id    		    = "river-formula-385606"
gcp_region        		    = "us-west1"
gcp_zones	  		        = ["us-west1-a", "us-west1-b", "us-west1-c"]
gke_cluster_name  		    = "org-e-dev-private-gke-cluster"
gke_machine_type		    = "n1-standard-1"
gke_min_count			    = 1
gke_max_count			    = 2
gke_disk_size_gb		    = 50
gke_disk_type               = "pd-standard"
gke_image_type              = "COS_CONTAINERD"
gke_initial_node_count      = 1
gke_network	  		        = "org-e-dev-private-gke-network-1"
gke_subnetwork	  		    = "org-e-dev-private-gke-subnetwork-1"
gke_service_account		    = "terraform@river-formula-385606.iam.gserviceaccount.com"
gke_cloudnat_name           = "org-e-dev-private-gke-cloutnat-1"
gke_cloudnat_router_name    = "org-e-dev-private-gke-router-1"
gke_namespace_names         = ["services", "monitoring"]