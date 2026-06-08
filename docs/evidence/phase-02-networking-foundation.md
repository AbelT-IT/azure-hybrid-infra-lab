# Phase 02 - Azure Networking Foundation

## Purpose

This phase creates the initial Azure networking foundation using Terraform.

The goal is to establish a basic enterprise-style hub network with segmented subnets and Network Security Groups before deploying compute, monitoring or private services.

## Business Problem Solved

Enterprise Azure environments require a structured network foundation to support:

- Workload segmentation
- Security boundary definition
- Future hybrid connectivity
- Future VPN or ExpressRoute integration
- Private workloads
- Controlled administrative access
- Network troubleshooting
- Governance and compliance

Creating networking through Terraform ensures the design is repeatable, auditable and version-controlled.

## Resources Created

The following resources were created in the network Resource Group:

| Resource | Name | Purpose |
|---|---|---|
| Virtual Network | vnet-hub-dev-weu-001 | Hub virtual network foundation |
| Subnet | snet-mgmt-dev-weu-001 | Management subnet |
| Subnet | snet-servers-dev-weu-001 | Server workload subnet |
| Subnet | snet-private-dev-weu-001 | Private workload subnet |
| Network Security Group | nsg-mgmt-dev-weu-001 | NSG for management subnet |
| Network Security Group | nsg-servers-dev-weu-001 | NSG for server subnet |
| Network Security Group | nsg-private-dev-weu-001 | NSG for private subnet |
| NSG Association | management | Associates management subnet with management NSG |
| NSG Association | servers | Associates servers subnet with servers NSG |
| NSG Association | private | Associates private subnet with private NSG |

## Network Design

| Component | CIDR |
|---|---|
| VNet | 10.10.0.0/16 |
| Management subnet | 10.10.1.0/24 |
| Servers subnet | 10.10.2.0/24 |
| Private subnet | 10.10.3.0/24 |

The `/16` VNet address space provides room for future subnet expansion while the `/24` subnets provide clear segmentation for the current lab design.

## Resource Group Placement

All networking resources were deployed into:

```text
rg-network-dev-weu-001
