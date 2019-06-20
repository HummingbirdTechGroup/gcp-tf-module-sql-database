variable env                    {}
variable name                   {}
#variable region                 {}
variable zone                   {}
variable tier                   {}
variable disk_size              {}
variable disk_type              {}
variable require_ssl            {}
variable private_network        {}
variable address_type           {}
variable database_version       {}
variable app_name               {} 
variable team                   {} 
variable cost_type              {} 
#variable whitelisted_name       {}
#variable whitelisted_ip         {}
variable public_ip              {default = "false"}
variable sql_user_count         {default = 1}
variable sql_user_name          {type = "list"}
variable sql_user_host          {type = "list"}
variable sql_user_password      {type = "list"}
variable binary_log_enabled     {default = "true"}
variable project                {default = "hummingbird-technologies"}

