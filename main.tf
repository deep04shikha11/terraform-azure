terraform{
	required_providers{
	 azurerm = {
		 source = "hashicorp/azurerm"
         version = "~> 4.8.0"
		}
	}
	required_version = ">=1.9.0"
}

provider "azurerm"{
	features{
	}
}


resource "azurerm_resource_group" "demo_first" {
  name     = "demo_first-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo_first" {
  name                     = "demo11storage"
  resource_group_name      = azurerm_resource_group.demo_first.name
  location                 = azurerm_resource_group.demo_first.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}