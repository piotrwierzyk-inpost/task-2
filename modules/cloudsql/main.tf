resource "random_password" "pgpw" {
  length  = 16
}

resource "google_sql_database_instance" "pg" {
  name             = "${var.env}-pg"
  database_version = "POSTGRES_15"

  settings {
    tier = "db-f1-micro"
    availability_type = "REGIONAL" 
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_self_link
    }
  }
  depends_on = [
    var.vpc_connection
    ]
}

resource "google_sql_user" "app" {
  name     = "appuser"
  instance = google_sql_database_instance.pg.name
  password = random_password.pgpw.result
}
