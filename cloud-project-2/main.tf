provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "jr-lab" {
    name     = "JR-Lab"
    location = "northeurope"
}

resource "azurerm_storage_account" "jr-lab-storage" {
  name                     = "jrlabsjakkf4"
  resource_group_name      = azurerm_resource_group.jr-lab.name
  location                 = azurerm_resource_group.northeurope.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}