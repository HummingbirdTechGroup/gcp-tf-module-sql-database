# Required to allow database exports
# see https://cloud.google.com/sql/docs/postgres/import-export/exporting
resource "google_storage_bucket_iam_member" "bucket_write" {
  bucket = var.backup_bucket
  role   = "roles/storage.objectCreator"
  member = "serviceAccount:${google_sql_database_instance.master.service_account_email_address}"
}

# Required to allow database imports
resource "google_storage_bucket_iam_member" "bucket_read" {
  bucket = var.import_bucket
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_sql_database_instance.master.service_account_email_address}"
}
