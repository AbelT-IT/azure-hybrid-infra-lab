# Phase 03 - Network Security Baseline

## Purpose

This phase defines the first custom Network Security Group rules for the Azure Hybrid Infrastructure Lab.

The goal is to move from default NSG behavior to an explicit security baseline that prepares the environment for future Virtual Machines and private workloads.

## Business Problem Solved

Enterprise cloud networks require clear traffic control between subnets and from external sources.

Without explicit security rules, teams may rely too heavily on default rules, accidentally allow lateral movement, or expose administrative ports incorrectly.

This phase establishes a baseline security model before deploying compute resources.

## Resources Updated

The following Network Security Groups were updated:

| NSG | Purpose |
|---|---|
| nsg-mgmt-dev-weu-001 | Management subnet security |
| nsg-servers-dev-weu-001 | Server subnet security |
| nsg-private-dev-weu-001 | Private subnet security |

## Custom Rules Created

| NSG | Rule | Priority | Direction | Access | Source | Destination | Ports | Purpose |
|---|---|---:|---|---|---|---|---|---|
| nsg-mgmt-dev-weu-001 | deny-internet-inbound | 4000 | Inbound | Deny | Internet | * | * | Explicitly deny inbound Internet traffic |
| nsg-servers-dev-weu-001 | allow-mgmt-to-servers-admin | 100 | Inbound | Allow | 10.10.1.0/24 | 10.10.2.0/24 | 22, 3389 | Allow controlled admin traffic from management subnet |
| nsg-servers-dev-weu-001 | deny-internet-inbound | 4000 | Inbound | Deny | Internet | * | * | Explicitly deny inbound Internet traffic |
| nsg-private-dev-weu-001 | deny-vnet-inbound-private | 3000 | Inbound | Deny | VirtualNetwork | 10.10.3.0/24 | * | Reduce lateral movement into private subnet |
| nsg-private-dev-weu-001 | deny-internet-inbound | 4000 | Inbound | Deny | Internet | * | * | Explicitly deny inbound Internet traffic |

## Security Design

The baseline follows these principles:

- Do not expose SSH or RDP directly to the Internet.
- Allow administrative traffic only from the management subnet to the servers subnet.
- Explicitly deny inbound Internet traffic.
- Restrict lateral movement into the private subnet.
- Prepare the environment for future VM deployment without opening public access.

## Current Access Model

```text
Management subnet, 10.10.1.0/24
  └── allowed to administer Servers subnet on TCP/22 and TCP/3389

Servers subnet, 10.10.2.0/24
  └── receives admin traffic only from Management subnet

Private subnet, 10.10.3.0/24
  └── protected from broad VirtualNetwork inbound traffic
