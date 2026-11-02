provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "jr-lab" {
    name     = "JR-Lab"
    location = "northeurope"
}