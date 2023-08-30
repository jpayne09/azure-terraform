
resource "azurerm_resource_group" "rggroup1" {
  name     = "johnterraform-rg"
  location = "eastus2"
}


resource "azurerm_service_plan" "webappplan1" {
  name                = "webappplan1"
  resource_group_name = azurerm_resource_group.rggroup1.name
  location            = azurerm_resource_group.rggroup1.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

