resource "google_service_account" "run_sa" {
  account_id   = "run-sa-${var.env}"
  display_name = "Cloud Run SA (${var.env})"
}

resource "google_storage_bucket_iam_member" "run_sa_bucket" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.run_sa.email}"
}

resource "google_project_iam_member" "run_sql" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.run_sa.email}"

  condition {
    title       = "cloudsql-only-${var.env}"
    description = "Limit SA to specific Cloud SQL instance"
    expression  = "resource.name.endsWith('${var.db_connection_name}')"
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.api.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
