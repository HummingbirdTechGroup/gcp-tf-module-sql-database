variable "env" {
}

variable "name" {
}

#variable region                 {}
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

variable "sql_user_count" {
  default = 0
}

variable "sql_user_name" {
  type = list(string)
  default = []
}

variable "sql_user_host" {
  type = list(string)
  default = []
}

variable "sql_user_password" {
  type = list(string)
  default = []
}

variable "binary_log_enabled" {
  default = "true"
}

variable "authorized_networks" {
  description = "A map of key/value pairs in the form of Name = CIDR"
# example:     "hb-staging" = "34.76.130.19/32"
  type        = map(string)
  default = {}
}
