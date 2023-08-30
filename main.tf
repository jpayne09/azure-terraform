terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azapi" {}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rggroup1" {
  name     = "johnterraform-rg"
  location = "eastus2"
}

module "web-app" {
  source   = "./module/compute/appservice"
}

module "webappplan1" {
  source      = "./module/compute/appserviceplan"
}
