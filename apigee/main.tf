terraform {
  required_providers {
    apigee = {
        source = "scastria/apigee"
        version = "=0.1.50"
    }

    azurerm = {
        source = "hashicorp/azurerm"
        version = "= 3.5.0"
    }
  }

  backend "azurerm" {}

  required_version = ">=1.1.9"
}

provider "azurerm" {
    alias = "subscriptions"
    features {

    }
}

provider "azurerm" {
    subscription_id = locals.subscriptions["alpha.one"]
    features {

    }
}

