terraform {
        required_providers {
                azurerm = {
                        source = "hashicorp/azurerm"
                        version = "2.96.0"
                }
        }
}

resource "azurerm_resource_group" "rg" {
        name = "kubernetes_rg"
        location = var.location

        tags = {
                environment = "CP2"
        }
}

resource "azurerm_storage_account" "stAccount" {
        name = "staccountcp2adrian"
        resource_group_name = azurerm_resource_group.rg.name
        location = azurerm_resource_group.rg.location
        account_tier = "Standard"
        account_replication_type = "LRS"

        tags = {
                environment = "CP2"
        }
}
