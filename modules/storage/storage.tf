resource "azurerm_storage_account" "mystorage_modul" {
  name                     = var.storage_name
  resource_group_name      = "rg-iacdemo"
  location                 = "northeurope"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}