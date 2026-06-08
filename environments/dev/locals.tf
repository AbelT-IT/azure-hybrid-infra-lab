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

locals {
  network_resource_group_name = local.resource_groups.network.name

  vnet_name = "vnet-hub-${var.environment}-${local.location_short}-001"

  subnets = {
    management = {
      name             = "snet-mgmt-${var.environment}-${local.location_short}-001"
      address_prefixes = var.subnet_address_prefixes.management
      purpose          = "management subnet for administrative access and future jumpbox resources"
    }

    servers = {
      name             = "snet-servers-${var.environment}-${local.location_short}-001"
      address_prefixes = var.subnet_address_prefixes.servers
      purpose          = "server subnet for internal infrastructure workloads"
    }

    private = {
      name             = "snet-private-${var.environment}-${local.location_short}-001"
      address_prefixes = var.subnet_address_prefixes.private
      purpose          = "private subnet for isolated workloads and future private endpoints"
    }
  }

  network_security_groups = {
    management = {
      name    = "nsg-mgmt-${var.environment}-${local.location_short}-001"
      purpose = "network security group for management subnet"
    }

    servers = {
      name    = "nsg-servers-${var.environment}-${local.location_short}-001"
      purpose = "network security group for server subnet"
    }

    private = {
      name    = "nsg-private-${var.environment}-${local.location_short}-001"
      purpose = "network security group for private subnet"
    }
  }
}
