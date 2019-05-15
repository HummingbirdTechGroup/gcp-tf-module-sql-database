variable env                    {}
variable name                   {}
<<<<<<< HEAD
variable region                 {}
=======
#variable region                 {}
>>>>>>> ea4f78e002bd92ac9791c2c58e189b04c67bdd64
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
variable whitelisted_name       {}
variable whitelisted_ip         {}

<<<<<<< HEAD


variable sql_user_name          {}
variable sql_user_host          {}
variable sql_user_password      {}
=======
variable public_ip              {default = "false"}
variable sql_user_count         {default = 1}
variable sql_user_name          {type = "list"}
variable sql_user_host          {type = "list"}
variable sql_user_password      {type = "list"}
>>>>>>> ea4f78e002bd92ac9791c2c58e189b04c67bdd64
