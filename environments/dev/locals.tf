locals {
  location_short = "weu"

  common_tags = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    cost_center = var.cost_center
    managed_by  = "terraform"
    lifecycle   = "lab"
  }

  resource_groups = {
    network = {
      name    = "rg-network-${var.environment}-${local.location_short}-001"
      purpose = "network foundation resources"
    }

    management = {
      name    = "rg-management-${var.environment}-${local.location_short}-001"
      purpose = "management and administrative resources"
    }

    monitoring = {
      name    = "rg-monitoring-${var.environment}-${local.location_short}-001"
      purpose = "monitoring and observability resources"
    }
  }
}
