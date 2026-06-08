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
