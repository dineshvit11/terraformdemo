output "key_vault_ids" {
  value = { for k, kv in azurerm_key_vault.kv : k => kv.id }
}
