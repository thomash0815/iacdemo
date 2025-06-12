provider "azurerm" {
  # skip_provider_registration = true
  subscription_id = var.subscription_id
  features {}
}

# tf commands

# terraform init
# terraform apply --auto-approve
# terraform destroy --auto-approve


# **************************** resources




# Storage
# resource "azurerm_storage_account" "mystorage" {
#   name                     = "mydemosto08154711"
#   resource_group_name      = "rg-iacdemo"
#   location                 = "northeurope"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


 


# **************************** Variablen

# resource "azurerm_storage_account" "mystorage" {
#   name                     = var.storage_name
#   resource_group_name      = "rg-iacdemo"
#   location                 = "northeurope"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


 


# **************************** Funktion (string intepol)

locals {
  storage_name = "${lower("myDEMOsto08154711")}"
}


# resource "azurerm_storage_account" "mystorage" {
#   name                     = local.storage_name
#   resource_group_name      = "rg-iacdemo"
#   location                 = "northeurope"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }




 
# **************************** If-else für sto typ lra-grs
locals {
  environment = "dev"
}

# resource "azurerm_storage_account" "mystorage" {
#   name                     = local.storage_name
#   resource_group_name      = "rg-iacdemo"
#   location                 = "northeurope"
#   account_tier             = "Standard"
#   account_replication_type = local.environment == "dev" ? "LRS" : "GRS"
# }




 
# **************************** Container per loop

locals {
  containers = ["bronze","silber","gold"]
}

# resource "azurerm_storage_container" "container" {
#   depends_on            = [azurerm_storage_account.mystorage]
#   for_each              = { for container in local.containers : container => container }
#   name                  = each.value
#   storage_account_id = azurerm_storage_account.mystorage.id
#   container_access_type = "private"
# }
 

 
 

# **************************** Data call

# data "azurerm_resource_group" "rg" {
#   name = "rg-iacdemo"
# }

# output "rg" {
#   value = data.azurerm_resource_group.rg
# }

# resource "azurerm_storage_account" "mystorage" {
#   name                     = local.storage_name
#   resource_group_name      = "rg-iacdemo"
#   location                 = data.azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = local.environment == "dev" ? "LRS" : "GRS"
# }





# **************************** Storage im modul

# module "platform-product-resource-group" {
#   source = "./modules/storage"
#   #source                  = "git::https://dev.azure.com/org/project/_git/repo-name//terraform-modules/mymodule"
#   storage_name = "${var.storage_name}mod" 
# }





# Puffer
#state
