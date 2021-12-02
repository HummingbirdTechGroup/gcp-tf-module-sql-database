variable "env" {
  type = string
  description = "The environment where the Cloud SQL instance must be created. E.g.: \"staging\" or \"production\"."
}

variable "name" {
  type = string
  description = "The base name to be given to Cloud SQL instance. Prefix and suffix will be added to it afterwards."
}

variable "zone" {
  type = string
  description = "GCP compute engine zone."
}

variable "tier" {
  type = string
  description = "The GCP machine type to use. Check Terraform docs to see the options."
}

variable "disk_size" {
  type = number
  description = "The size of data disk, in GB."
}

variable "disk_type" {
  type = string
  description = "The type of data disk: PD_SSD or PD_HDD."
}

variable "require_ssl" {
  type = bool
  description = "Whether SSL connections over IP are enforced or not."
}

variable "private_network" {
  type = string
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP."
}

variable "enable_public_ip" {
  type = bool
  default = true # for backwards compatibility only
  description = "Wheter a public IP address must be assigned to this Cloud SQL instance or not."
}

variable "address_type" {
}

variable "database_version" {
  type = string
  description = "The MySQL, PostgreSQL or SQL Server version to use. Check Terraform docs to see possible values."
}

variable "database_flags" {
  type        = map(string)
  default = {}
  description = "Flags to be assigned to the Cloud SQL instance. Check Terraform docs to see possible options."
}

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)."
  default = "ZONAL"
}

variable "app_name" {
  type = string
  description = "Name of the application the DB will serve to as data backend."
}

variable "labels" {
  type = map
  default = {}
  description = "A set of key/value user label pairs to assign to the instance."
}

variable "team" {
  type = string
  description = "Name of the organization team that is in charge of the application and DB."
}

variable "cost_type" {
  type = string
  description = "The type of cost this DB incurs into."
}

variable "sql_user_name" {
  type = list(string)
  default = []
  description = "A list of user names to create Google SQL Users from."
}

variable "sql_user_host" {
  type = list(string)
  default = []
  description = "A list of hosts the Google SQL Users would be allowed to connect from."
}

variable "binary_log_enabled" {
  default = "true"
}

variable "authorized_networks" {
  description = "A map of key/value pairs in the form of Name = CIDR. E.g.: \"hb-staging\" = \"34.76.130.19/32\""
  type        = map(string)
  default = {}
}

variable "wait_after_create" {
  type = number
  default = 1
  description = "Amount of seconds to wait after the Cloud SQL instance is created."
}

variable "backup_bucket" {
  type = string
  description = "Name of the GCP Storage Bucket used to keep DB backups."
}

variable "import_bucket" {
  type = string
  description = "Name of the GCP Storage Bucket where DB can be imported from."
}

variable "deletion_protection" {
  default = true
  description = "If a DB instance should not be deleted by terraform, unless this flag changed manually."
}

variable "database_name" {
  type = string
  default = ""
  description = "The name of the database to be created in the instance, if any."
}
