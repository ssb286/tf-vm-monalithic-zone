
resource "azurerm_nat_gateway" "nat" {
  for_each                = var.nat
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = "StandardV2"
  idle_timeout_in_minutes = 10
}
resource "azurerm_public_ip" "nat_pip" {
  for_each            = var.nat
  name                = each.value.namenatpip 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "StandardV2"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_assoc" {
  for_each             = var.nat
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = azurerm_public_ip.nat_pip[each.key].id
}