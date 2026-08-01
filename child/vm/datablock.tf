data "azurerm_network_interface" "nicdatablock" {
  for_each = var.vms
  name         =each.value.name_nicdata
  resource_group_name = each.value.resource_group_name
}
