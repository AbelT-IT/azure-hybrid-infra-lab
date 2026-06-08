variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name used for tagging and documentation."
  type        = string
  default     = "azure-hybrid-infra-lab"
}

variable "owner" {
  description = "Technical owner of the deployed resources."
  type        = string
  default     = "infrastructure"
}

variable "cost_center" {
  description = "Cost center used for billing and ownership tracking."
  type        = string
  default     = "it-cloud"
}

variable "vnet_address_space" {
  description = "Address space for the hub virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the hub subnets."
  type = object({
    management = list(string)
    servers    = list(string)
    private    = list(string)
  })

  default = {
    management = ["10.10.1.0/24"]
    servers    = ["10.10.2.0/24"]
    private    = ["10.10.3.0/24"]
  }
}
