terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

variable "azurer_resource_region" {
  type = string
  description = "define custom region for the azure resource"
  default="West Europe"
}


provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "group1" {
    name = "muticloud-demo-group"
    location = "West Europe"
    tags = {
        environment = "dev"
    }
}


resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.group1.name
  location            = azurerm_resource_group.group1.location
  address_space       = ["10.0.0.0/16"]
}