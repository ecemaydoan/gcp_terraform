
resource "google_compute_router" "router" {
  name    = "ecem-terraform-router"
  region  = var.gcp_region
  network = module.vpc.network_name
}


resource "google_compute_router_nat" "nat" {
  name                               = "ecem-terraform-nat"
  router                             = google_compute_router.router.name
  region                             = var.gcp_region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

 
}

