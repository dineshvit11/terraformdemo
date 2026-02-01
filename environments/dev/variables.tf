variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}

variable "public_ips" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    allocation_method       = string # Static / Dynamic
    sku                     = optional(string, "Standard")
    sku_tier                = optional(string, "Regional")
    zones                   = optional(list(string), [])
    ip_version              = optional(string, "IPv4")
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number, 4)
    ip_tags                 = optional(map(string), {})
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    tags                    = optional(map(string), {})
  }))
}

variable "key_vaults" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}

variable "key_vault_secrets" {
  type = map(object({
    name   = string
    value  = string
    kv_key = string
  }))
  default = {}
}


variable "sql_servers" {
  type = map(object({
    sql_server_name = string
    rg_name         = string
    location        = string
    admin_username  = string
    admin_password  = string
    tags            = optional(map(string))
  }))
}

variable "sql_dbs" {
  type = map(object({
    sql_db_name  = string
    # server_id    = optional(string)
    collation    = string
    max_size_gb  = string
    sku_name     = string
    compute_model = optional(string)
    enclave_type = optional(string)
    min_capacity = optional(number)
    auto_pause_delay_in_minutes = optional(number)
    tags         = map(string)
  }))
}


variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    rg_name                = string
    vnet_name              = string
    subnet_name            = string
    pip_name               = string
    vm_name                = string
    size                   = string
    kv_name                = string
    admin_username         = optional(string)
    admin_password         = optional(string)
    source_image_reference = map(string)
  }))
}
