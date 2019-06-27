variable "env" {
}

variable "name" {
}

variable "zone" {
}

variable "tier" {
}

variable "disk_size" {
}

variable "disk_type" {
}

variable "require_ssl" {
}

variable "private_network" {
}

#variable ip_purpose             {}
variable "address_type" {
}

variable "database_version" {
}

#variable prefix_length          {}
#variable network                {}
#variable certificate            {}

variable "app_name" {
}

variable "team" {
}

variable "cost_type" {
}

#variable sql_user_name          {}
#variable sql_user_host          {}
#variable sql_user_password      {}

variable "whitelisted_name" {
}

variable "whitelisted_ip" {
}

variable "authorized_networks" {
  description = "A list of whitelisted IP addresses."
  type        = map(string)
  default = {
    name  = "hb-staging"
    value = "34.76.130.19/32"
  }
}

