resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "${var.prefix}-subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "${var.prefix}-subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "${var.prefix}-Production"
  }
}

resource "azurerm_network_security_group" "example" {
  name                = "${var.prefix}-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}