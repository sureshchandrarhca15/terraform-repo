module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "~> 3.4.0"

    project_id   = var.gcp_project_id
    network_name = var.gke_network
    shared_vpc_host = false
}

module "subnet" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "~> 3.4.0"

    project_id   = var.gcp_project_id
    network_name = var.gke_network

    subnets = [
        {
            subnet_name           = var.gke_subnetwork
            subnet_ip             = "192.168.7.0/26"
            subnet_region         = var.gcp_region
        }
    ]

    secondary_ranges = {
        var.gke_subnetwork = [
            {
                range_name    = "pods-address"
                ip_cidr_range = "10.7.0.0/20"
            },
            {
                range_name    = "services-address"
                ip_cidr_range = "10.101.0.0/23"
            },
        ]
    }

    depends_on = [ module.vpc ]
}