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

variable "enable_public_ip" {
  default = true # for backwards compatibility only
}

#variable ip_purpose             {}
variable "address_type" {
}

variable "database_version" {
}

variable "database_flags" {
  type        = map(string)
  default = {}
}

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)."
  default = "ZONAL"
}

#variable prefix_length          {}
#variable network                {}
#variable certificate            {}

variable "app_name" {
}

variable "labels" {
  type = map
  default = {}
}

variable "team" {
}

variable "cost_type" {
}

variable "sql_user_name" {
  type = list(string)
  default = []
}

variable "sql_user_host" {
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

variable "wait_after_create" {
  type = number
  default = 1
}

variable "backup_bucket" {

}

variable "import_bucket" {

}

variable "deletion_protection" {
  default = true
  description = "If a DB instance should not be deleted by terraform, unless this flag changed manually"
}

variable "database_name" {
  type = string
  default = ""
  description = "The name of the database to be created in the instance, if any"
}
