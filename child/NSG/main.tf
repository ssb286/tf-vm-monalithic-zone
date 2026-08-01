resource "azurerm_network_security_group" "NSG" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.name_rule_http
    priority                   = "100"
    direction                  = each.value.direction
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range_http
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = each.value.name_rule_ssh
    priority                   = "110"
    direction                  = each.value.direction
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range_ssh
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}