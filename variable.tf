variable "gcp_bucket_standard" {
    type = string
    default="REGIONAL"
}

variable "gcp_project" {
    type = string
    default="devops-juniors"
}

variable "gcp_project_id" {
    type = string
    default="devops-juniors"
}

variable "gcp_region" {
    type = string
    default = "us-east1"
}

variable "k8s-sa-name" {
    type = string
    default = "terraform-service-account"
}

variable "default_sa" {
    type = string
    default = ""
}

variable "ip_range_pods" {
  description = "GKE pods"
  type        = string
  default     = "subnet-gke-pods" 
}

variable "ip_range_services" {
  description = "GKE services"
  type        = string
  default     = "subnet-gke-services"
}

variable "subnet-name" {
    description = "Subnet name"
    type = string
    default = "ecem-subnet"
}