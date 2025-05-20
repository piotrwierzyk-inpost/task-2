resource "google_cloud_run_service" "api" {
  name     = "${var.env}-api"
  location = var.region

  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector_name
        "run.googleapis.com/vpc-access-egress"    = "all-traffic"
        "run.googleapis.com/cloudsql-instances"   = var.db_connection_name
        "autoscaling.knative.dev/minScale"            = "0"
        "autoscaling.knative.dev/maxScale"            = "3"
      }
    }
    spec {
      containers {
        
        image = "gcr.io/google-samples/hello-app:1.0"

        env {
          name  = "DB_HOST"
          value = "/cloudsql/${var.db_connection_name}"
        }
        env {
          name  = "DB_USER"
          value = var.db_user
        }
        env {
          name  = "DB_PASS"
          value = var.db_pass
        }
        env {
          name  = "BUCKET"
          value = var.bucket_name
        }
      }
      service_account_name = google_service_account.run_sa.email
      container_concurrency = 80

    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}
