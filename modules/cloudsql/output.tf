output "connection_name" {
  value = google_sql_database_instance.pg.connection_name
}

output "db_user" {
  value = google_sql_user.app.name
}

output "db_pass" {
  value = random_password.pgpw.result
}
