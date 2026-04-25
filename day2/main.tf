terraform{
	required_providers{
	 azurerm = {
		 source = "hashicorp/azurerm"
         version = "~> 4.8.0"
		}
	}
	backend "azurerm" {
    resource_group_name  = "tfstate-day04"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "day0420158"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
	required_version = ">=1.9.0"
}

provider "azurerm"{
	features{
	}
}


resource "azurerm_resource_group" "demo_remote" {
  name     = "demo_remote-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "demo_remote" {
  name                     = "demo22remote"
  resource_group_name      = azurerm_resource_group.demo_remote.name
  location                 = azurerm_resource_group.demo_remote.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}