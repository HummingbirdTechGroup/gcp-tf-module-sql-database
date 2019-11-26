output "first_ip_address" {
  value = google_sql_database_instance.master.first_ip_address
}

output "ip_address" {
  value = google_sql_database_instance.master.ip_address.0.ip_address
}

output "connection_name" {
  value = google_sql_database_instance.master.connection_name
}

output "self_link" {
  value = google_sql_database_instance.master.self_link
}

output "certificate" {
  value = google_sql_database_instance.master.server_ca_cert.0.cert
}
