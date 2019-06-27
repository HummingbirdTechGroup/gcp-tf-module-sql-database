#data "null_resource" "ip_range" {
#    count       = "${length(var.whitelisted_ip)}" 
#    name        = "${element(var.whitelisted_name, count.index)}"    
#    value       = "${element(var.whitelisted_ip, count.index)}"    
#}

locals {
  ip_names     = [var.whitelisted_name]
  ip_addresses = [var.whitelisted_ip]
}

resource "google_sql_database_instance" "master" {
  name = "hb-${var.env}-${var.name}-db"

  #   master_instance_name    = "hb-${var.env}-${var.name}-mdb"
  database_version = var.database_version
  region           = var.zone

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier      = var.tier
    disk_size = var.disk_size
    disk_type = var.disk_type
    user_labels = {
      env       = var.env
      name      = var.name
      app_name  = var.app_name
      team      = var.team
      cost_type = var.cost_type
    }

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = var.require_ssl
      private_network = var.private_network

          authorized_networks = [ 
              {
                  name            = "${var.whitelisted_name}"
                  value           = "${var.whitelisted_ip}"
              }
          ]
    }

    backup_configuration {
      binary_log_enabled = true
      enabled            = true
      start_time         = "02:30"
    }

    maintenance_window {
      day          = 1 # Monday
      hour         = 2 # 2AM
      update_track = "stable"
    }
  }
}

#resource "google_sql_user" "sql_user" {
#
#    name        = "${var.sql_user_name}"
#    instance    = "${google_sql_database_instance.master.name}"
#    host        = "${var.sql_user_host}"
#    password    = "${var.sql_user_password}"
#
#    depends_on = ["google_sql_database_instance.master"]

#    replica_configuration {
#        ca_certificate                  = "${var.certificate}"
#    }

#}

#resource "google_compute_global_address" "public_ip_address" {
#    name                    = "hb-${var.env}-${var.name}-ip"
##    purpose                 = "${var.ip_purpose}"
#    address_type            = "${var.address_type}"
##    prefix_length           = "${var.prefix_length}"
##    network                 = "${var.network}"
#}   

