output "connector_name" {
  value = google_vpc_access_connector.connector.name
}

output "vpc_connection" {
  value = google_service_networking_connection.vpc_connection
}

output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}
