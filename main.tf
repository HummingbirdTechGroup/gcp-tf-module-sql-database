resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {
  name = "hb-${var.env}-${var.name}-db-${random_id.db_name_suffix.hex}"

  database_version    = var.database_version
  region              = var.zone
  deletion_protection = var.deletion_protection

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier              = var.tier
    disk_size         = var.disk_size
    disk_autoresize   = true
    disk_type         = var.disk_type
    user_labels       = local.labels
    availability_type = var.availability_type

    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }

    ip_configuration {
      ipv4_enabled    = var.enable_public_ip
      require_ssl     = var.require_ssl
      private_network = var.private_network

      # Add an authorized_networks block for each network
      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.key
          value = authorized_networks.value
        }
      }
    }

    backup_configuration {
      binary_log_enabled = var.binary_log_enabled
      enabled            = true
      start_time         = "02:30"
    }

    maintenance_window {
      day          = 1 # Monday
      hour         = 2 # 2AM
      update_track = "stable"
    }
  }

  provisioner "local-exec" {
    command = "sleep  ${var.wait_after_create}"
  }

  lifecycle {
    ignore_changes = [
      name,
      disk_size
    ]
  }
}

resource "random_password" "password" {
  count       = length(var.sql_user_name)
  length      = 16
  special     = false
  min_numeric = 1
  min_upper   = 1
  min_lower   = 1
}

resource "google_sql_user" "sql_user" {
  count    = length(var.sql_user_name)
  name     = element(var.sql_user_name, count.index)
  instance = google_sql_database_instance.master.name
  host     = element(var.sql_user_host, count.index)
  password = random_password.password[count.index].result

  lifecycle {
    ignore_changes = [host]
  }

  provisioner "local-exec" {
    command = "sleep ${var.wait_after_create}"
  }
}

resource "google_sql_database" "database" {
  count    = length(var.database_name) > 0 ? 1 : 0
  name     = var.database_name
  instance = google_sql_database_instance.master.name
}
