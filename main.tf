resource "google_sql_database_instance" "master" {
  name = "hb-${var.env}-${var.name}-db"

  # master_instance_name    = "hb-${var.env}-${var.name}-mdb"
  database_version = var.database_version
  region           = var.zone

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier      = var.tier
    # disk_size = var.disk_size
    disk_autoresize = true
    disk_type = var.disk_type
    user_labels = {
      env       = var.env
      name      = var.name
      app_name  = var.app_name
      team      = var.team
      cost_type = var.cost_type
    }

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
}

resource "google_sql_user" "sql_user" {
  count    = length(var.sql_user_name)
  name     = element(var.sql_user_name, count.index)
  instance = google_sql_database_instance.master.name
  host     = element(var.sql_user_host, count.index)
  password = element(var.sql_user_password, count.index)
  #    replica_configuration {
  #        ca_certificate                  = "${var.certificate}"
  #    }
  lifecycle {
    ignore_changes = [host]
  }

  provisioner "local-exec" {
    command = "sleep ${var.wait_after_create}"
  }
}

#resource "google_compute_global_address" "public_ip_address" {
#    name                    = "hb-${var.env}-${var.name}-ip"
##    purpose                 = "${var.ip_purpose}"
#    address_type            = "${var.address_type}"
##    prefix_length           = "${var.prefix_length}"
##    network                 = "${var.network}"
#}
