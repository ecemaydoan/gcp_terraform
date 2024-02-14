resource "google_cloudbuild_trigger" "trigger" {
  location = var.gcp_region

  trigger_template {
    branch_name = "master"
    repo_name   = "ecem-terraform"
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "cloudbuild.yaml"

    depends_on = [module.gke]

}