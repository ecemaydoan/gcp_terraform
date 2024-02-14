module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 8.1"

    project_id   = var.gcp_project_id
    network_name = "ecem-vpc"
    routing_mode = "REGIONAL"

    
    

    subnets = [
       
        {
            subnet_name           = "ecem-subnet"
            subnet_ip             = "10.10.0.0/24"
            subnet_region         = "us-east1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            
        }
        
    ]

    secondary_ranges = {
        ecem-subnet = [
            {
                range_name    = "subnet-gke-services"
                ip_cidr_range = "10.10.1.0/24"
            },
            {
                range_name    = "subnet-gke-pods"
                ip_cidr_range = "10.10.2.0/24"
            }
        ]


        
    }

    }


# output "subnet_gke_services_range" {
#   value = module.vpc.subnets[0].secondary_ranges["subnet-01"][0].ip_cidr_range
# }

# output "subnet_gke_pods_range" {
#   value = module.vpc.subnets[0].secondary_ranges["subnet-02"][0].ip_cidr_range
# }