module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  depends_on = [ module.resource_group ]
  source   = "../../modules/azurerm_networking"
  networks = var.networks
}

module "public_ip" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}


# Key Vault Secret create block
resource "azurerm_key_vault_secret" "secrets" {
  for_each = var.key_vault_secrets

  name         = each.value.name
  value        = each.value.value
  key_vault_id = module.key_vault.key_vault_ids[each.value.kv_key]
}


module "sql_server" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_sql_server"
  sql_server = var.sql_servers
}

module "sql_db" {  
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_sql_database"
  sql_db     = var.sql_dbs
  default_server_id  = module.sql_server.sql_server_ids["sql1"]

}

module "vms_module" {  
  depends_on = [ module.resource_group, module.network, module.public_ip, module.key_vault, azurerm_key_vault_secret.secrets ]
  source = "../../modules/azurerm_compute"
  vms = var.vms
}


