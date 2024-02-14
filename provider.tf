provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = "us-east1-c"
}

terraform {

  # backend "gcs" { 
  #   bucket="demo-state-bucket-ecem"
  #   prefix = "terraform/state"
  # }
    required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
  required_version = ">= 0.13"
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}