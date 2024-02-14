
# module "ecem_terraform_workload_identity" {
#   source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  

#   cluster_name        = "ecem-cluster"
#   location            = var.gcp_region
#   name                = "terraform-sa"
#   namespace           = "default"
#   project_id          = var.gcp_project_id
#   roles               = ["roles/storage.objectViewer"]
# }



resource "google_storage_bucket" "app-bucket" {
  name     = "terraform_project_app_bucket_ecem"
  location = var.gcp_region
}


resource "google_storage_bucket_object" "app-object" {
  name   = "app-object"
  bucket = google_storage_bucket.app-bucket.name
  source = "/Users/ecemaydogan/Downloads/T-GCPACE-m5-l7-file-en-31.pdf.en.pdf"
}







