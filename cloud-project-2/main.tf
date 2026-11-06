provider "azurerm" {
  features {
    
  }
}

#Mappen alt ligger i
resource "azurerm_resource_group" "lab" {
    name     = "JR-Lab"
    location = "northeurope"
}

#Storage account 
resource "azurerm_storage_account" "storage" {
  name                     = "jrlabsjakkf4"
  resource_group_name      = azurerm_resource_group.lab.name
  location                 = azurerm_resource_group.lab.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

#Innstilling for den statiske nettsiden
resource "azurerm_storage_account_static_website" "static_site" {
  storage_account_id = azurerm_storage_account.storage.id
  index_document     = "index.html"
}

#Containeren som lages av Azure, hensviser til "storage account" og "depends_on"
data "azurerm_storage_container" "web" {
  name               = "$web"
  storage_account_id = azurerm_storage_account.storage.id
  depends_on = [azurerm_storage_account_static_website.static_site]
}

#Bloben som er i containeren
resource "azurerm_storage_blob" "index_html" {
  name                 = "index.html"
  storage_container_id = data.azurerm_storage_container.web.id
  type                 = "Block"
  content_type         = "text/html" 
  source               = "index.html"
}

#Ikke testet
output "sjakksiden" {
  description = "Skriver ut nettadressen etter apply"
  value       = azurerm_storage_account.storage.id
}
