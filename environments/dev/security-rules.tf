resource "azurerm_network_security_rule" "hub" {
  for_each = local.network_security_rules

  name                         = each.value.name
  priority                     = each.value.priority
  direction                    = each.value.direction
  access                       = each.value.access
  protocol                     = each.value.protocol
  source_port_range            = each.value.source_port_range
  destination_port_range       = try(each.value.destination_port_range, null)
  destination_port_ranges      = try(each.value.destination_port_ranges, null)
  source_address_prefix        = each.value.source_address_prefix
  destination_address_prefix   = try(each.value.destination_address_prefix, null)
  destination_address_prefixes = try(each.value.destination_address_prefixes, null)

  resource_group_name         = local.network_resource_group_name
  network_security_group_name = azurerm_network_security_group.hub[each.value.nsg_key].name
}
