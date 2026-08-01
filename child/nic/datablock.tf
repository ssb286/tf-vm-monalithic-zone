data "azurerm_subnet" "dataofsubnet" {
    for_each = var.nic
  name                 = each.value.nameofdatasubnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}