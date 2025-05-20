resource "google_storage_bucket" "static" {
  name     = "${var.project}-${var.env}-static"
  location = var.region
  uniform_bucket_level_access = true
}
