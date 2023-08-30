resource "azurerm_resource_group" "rggroup1" {
  name     = "johnterraform-rg"
  location = "eastus2"
}

module "appplan" {
  source = "../appserviceplan"
  # Other module2 configuration here
}


resource "azurerm_linux_web_app" "web-app" {
  name                = "webappppp2"
  resource_group_name = azurerm_resource_group.rggroup1.name
  location            = azurerm_resource_group.rggroup1.location
  service_plan_id     = module.appplan.azure_service_plan_id

  site_config {}
}