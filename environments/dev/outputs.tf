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
