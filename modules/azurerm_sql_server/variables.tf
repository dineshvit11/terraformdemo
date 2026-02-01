
variable "sql_server" {
  type = map(object({
    sql_server_name = string
    rg_name         = string
    location        = string
    admin_username  = string
    admin_password  = string
    tags = optional(map(string))
  }))
}
# variable "sql_server_name" {}
# variable "rg_name" {}
# variable "location" {}
# variable "admin_username" {}
# variable "admin_password" {}
# variable "tags" {}