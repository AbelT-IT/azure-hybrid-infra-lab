resource "azurerm_resource_group" "foundation" {
  for_each = local.resource_groups

  name     = each.value.name
  location = var.location

  tags = merge(
    local.common_tags,
    {
      workload = each.key
      purpose  = each.value.purpose
    }
  )
}
