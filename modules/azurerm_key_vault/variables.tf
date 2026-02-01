variable "key_vaults" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}
