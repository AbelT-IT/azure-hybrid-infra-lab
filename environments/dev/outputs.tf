output "resource_group_names" {
  description = "Names of the created foundation resource groups."
  value       = [for rg in azurerm_resource_group.foundation : rg.name]
}

output "resource_group_locations" {
  description = "Locations of the created foundation resource groups."
  value = {
    for key, rg in azurerm_resource_group.foundation : key => rg.location
  }
}

output "resource_group_tags" {
  description = "Tags applied to each foundation resource group."
  value = {
    for key, rg in azurerm_resource_group.foundation : key => rg.tags
  }
}

output "virtual_network_name" {
  description = "Name of the hub virtual network."
  value       = azurerm_virtual_network.hub.name
}

output "virtual_network_address_space" {
  description = "Address space of the hub virtual network."
  value       = azurerm_virtual_network.hub.address_space
}

output "subnet_names" {
  description = "Names of the hub subnets."
  value = {
    for key, subnet in azurerm_subnet.hub : key => subnet.name
  }
}

output "network_security_group_names" {
  description = "Names of the network security groups."
  value = {
    for key, nsg in azurerm_network_security_group.hub : key => nsg.name
  }
}
