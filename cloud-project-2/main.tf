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
  location                 = azurerm_resource_group.jr-lab.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account_static_website" "sjakkmatt" {
  storage_account_id = azurerm_storage_account.jr-lab-storage.id
  index_document     = "index.html"
}

resource "azurerm_storage_blob" "sjakkmatt" {
  name                 = "index.html"
  storage_container_id = data.azurerm_storage_container.web
  type                 = "text/html"
  source               = "index.html"
}

data "azurerm_storage_container" "web" {
  name               = "$web"
  storage_account_id = azurerm_storage_account.jr-lab-storage.id
  depends_on = [azurerm_storage_account_static_website.sjakkmatt]
}