
data "azurerm_subnet" "dataofbastionsubnet" {
    for_each = var.bastion
  name                 = each.value.dataofbastionsubnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "datablockofpip" {
    for_each = var.bastion
  name                = each.value.datablockofpip
  resource_group_name = each.value.resource_group_name
}