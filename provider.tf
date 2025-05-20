terraform {
  required_version = ">= 1.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

terraform {
 backend "gcs" {
    bucket      = "tf-state-inpost-devops-assessment"
    prefix      = "cloudrun"
 }
}
