

data "google_client_config" "default" {}


module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.gcp_project_id
  name                       = "ecem-cluster"
  region                     = var.gcp_region
  zones                      = ["us-east1-c"]
  network                    = module.vpc.network_name
  subnetwork                 = var.subnet-name
  ip_range_pods     =  module.vpc.subnets_secondary_ranges[0][0].range_name
  ip_range_services =  module.vpc.subnets_secondary_ranges[0][1].range_name
  http_load_balancing        = false
  network_policy             = false 
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "10.0.0.0/28"
  create_service_account = false
  service_account = var.default_sa

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-small"
      node_locations            = "us-east1-c"
      min_count                 = 1
      max_count                 = 100
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      logging_variant           = "DEFAULT"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.default_sa
      preemptible               = false
      initial_node_count        = 1
    },
  ]

  # node_pools_oauth_scopes = {
  #   all = [
  #     "https://www.googleapis.com/auth/logging.write",
  #     "https://www.googleapis.com/auth/monitoring",
  #   ]
  # }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  

}




