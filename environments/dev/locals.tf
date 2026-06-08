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

locals {
  network_security_rules = {
    deny_internet_inbound_management = {
      name                       = "deny-internet-inbound"
      nsg_key                    = "management"
      priority                   = 4000
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      purpose                    = "explicitly deny inbound traffic from the Internet"
    }

    deny_internet_inbound_servers = {
      name                       = "deny-internet-inbound"
      nsg_key                    = "servers"
      priority                   = 4000
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      purpose                    = "explicitly deny inbound traffic from the Internet"
    }

    deny_internet_inbound_private = {
      name                       = "deny-internet-inbound"
      nsg_key                    = "private"
      priority                   = 4000
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
      purpose                    = "explicitly deny inbound traffic from the Internet"
    }

    allow_management_to_servers_admin = {
      name                         = "allow-mgmt-to-servers-admin"
      nsg_key                      = "servers"
      priority                     = 100
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_ranges      = ["22", "3389"]
      source_address_prefix        = "10.10.1.0/24"
      destination_address_prefixes = ["10.10.2.0/24"]
      purpose                      = "allow controlled administrative access from management subnet to servers subnet"
    }

    deny_vnet_inbound_private = {
      name                         = "deny-vnet-inbound-private"
      nsg_key                      = "private"
      priority                     = 3000
      direction                    = "Inbound"
      access                       = "Deny"
      protocol                     = "*"
      source_port_range            = "*"
      destination_port_range       = "*"
      source_address_prefix        = "VirtualNetwork"
      destination_address_prefixes = ["10.10.3.0/24"]
      purpose                      = "deny lateral movement into the private subnet"
    }
  }
}
