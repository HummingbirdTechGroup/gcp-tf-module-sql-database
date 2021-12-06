output "name" {
  value = google_sql_database_instance.master.name
}

output "first_ip_address" {
  value = google_sql_database_instance.master.first_ip_address
}

output "ip_address" {
  value = google_sql_database_instance.master.ip_address.0.ip_address
}

output "private_ip_address" {
  value = google_sql_database_instance.master.private_ip_address
}

output "public_ip_address" {
  value = google_sql_database_instance.master.public_ip_address
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

output "service_account_email_address" {
  value = google_sql_database_instance.master.service_account_email_address
}

output "database_password_list" {
  value = random_password.password
}

output "database_users" {
  value = google_sql_user.sql_user
}

output "database_name" {
  value = length(var.database_name) > 0 ? google_sql_database.database[0].name : ""
}
