locals {
  required_services = [
    "compute.googleapis.com",             // VPC, subnets
    "iam.googleapis.com",                 // Service Account
    "cloudresourcemanager.googleapis.com",// granting IAM roles
    "run.googleapis.com",                 // Cloud Run
    "sqladmin.googleapis.com",            // Cloud SQL
    "storage.googleapis.com",             // GCS
    "vpcaccess.googleapis.com",           // Serverless VPC Connector
    "servicenetworking.googleapis.com",   // Private Service Access (Cloud SQL)
  ]
}

resource "google_project_service" "required" {
  for_each = toset(local.required_services)

  project            = var.project
  service            = each.value
  disable_on_destroy = false
}
