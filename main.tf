resource "google_sql_database_instance" "master" {
    name                    = "hb-${var.env}-${var.name}-db"
    database_version        = "${var.database_version}"
    region                  = "${var.zone}"

    settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
        tier                = "${var.tier}"
        disk_size           = "${var.disk_size}"
        disk_type           = "${var.disk_type}"
    #    user_labels         = ["${var.labels}"]

    

    ip_configuration {
        ipv4_enabled        = "true"
        require_ssl         = "${var.require_ssl}"
        private_network     = "${var.private_network}"
    #    authorized_networks = ["${var.authorized_networks}"]
    }
}
}

#resource "google_compute_global_address" "private_ip_address" {
#    name                    = "hb-${var.env}-${var.name}-ip"
#    purpose                 = "${var.ip_purpose}"
#    address_type            = "${var.address_type}"
#    prefix_length           = "${var.prefix_length}"
#    network                 = "${var.network}"
#}   