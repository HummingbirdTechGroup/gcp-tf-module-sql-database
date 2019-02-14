output "first_ip_address" {
  value = "google_sql_database_instance.first_ip_address"
}

output "ip_address" {
  value = "google_sql_database_instance.ip_address.0.ip_address"
}

output "connection_name" {
  value = "google_sql_database_instance.connection_name"
}


output "self_link" {
  value = "google_sql_database_instance.self_link"
}


output "certificate" {
  value = "google_sql_database_instance.server_ca_cert.0.cert"
}
