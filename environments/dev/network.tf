resource "azurerm_virtual_network" "hub" {
  name                = local.vnet_name
  location            = var.location
  resource_group_name = local.network_resource_group_name
  address_space       = var.vnet_address_space

  tags = merge(
    local.common_tags,
    {
      workload = "network"
      purpose  = "hub virtual network foundation"
    }
  )

  depends_on = [
    azurerm_resource_group.foundation
  ]
}

resource "azurerm_subnet" "hub" {
  for_each = local.subnets

  name                 = each.value.name
  resource_group_name  = local.network_resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "hub" {
  for_each = local.network_security_groups

  name                = each.value.name
  location            = var.location
  resource_group_name = local.network_resource_group_name

  tags = merge(
    local.common_tags,
    {
      workload = each.key
      purpose  = each.value.purpose
    }
  )

  depends_on = [
    azurerm_resource_group.foundation
  ]
}

resource "azurerm_subnet_network_security_group_association" "hub" {
  for_each = azurerm_subnet.hub

  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.hub[each.key].id
}
