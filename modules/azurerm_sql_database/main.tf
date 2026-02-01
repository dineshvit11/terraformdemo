resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_db

  name         = each.value.sql_db_name
  server_id    = var.default_server_id
  collation    = each.value.collation
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags = each.value.tags
}
