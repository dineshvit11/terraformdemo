# variable "sql_db" {
#   type = map(object({
#     sql_db_name  = string
#     server_id    = optional(string)
#     collation    = string
#     max_size_gb  = string
#     sku_name     = string
#     enclave_type = string
#     auto_pause_delay_in_minutes = string
#     min_capacity = string
#     tags         = optional(map(string))
#   }))
# }


variable "sql_db" {
  type = map(any)
}

variable "default_server_id" {
  type = string
}

# variable "sql_db_name" {}
# variable "server_id" {}
# variable "max_size_gb" {}
# variable "tags" {}
