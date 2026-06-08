# Cost Control Policy

## Purpose

This document defines the cost control rules for the Azure Hybrid Infrastructure Lab.

The project uses a personal Azure subscription with free credits for learning and portfolio purposes. The goal is to build realistic Azure infrastructure using Terraform while avoiding unnecessary or unexpected cloud costs.

## Subscription Context

- Cloud provider: Microsoft Azure
- Subscription type: Azure Free / personal learning subscription
- Credit model: 200 USD free credit, expires after 30 days
- Project owner: Abel Tana
- Repository: azure-hybrid-infra-lab

## Cost Control Principles

Every deployed resource must be:

1. Justified
2. Tagged
3. Documented
4. Reviewed
5. Destroyed when no longer needed

## Default Lab Policy

This project follows an ephemeral infrastructure model.

Resources are created for a specific lab phase, validated, documented, and destroyed after testing unless there is a clear reason to keep them temporarily.

## High-Risk Cost Resources

The following resources must not be deployed without explicit review:

- Virtual Machines
- Managed Disks
- Public IP Addresses
- Azure Bastion
- NAT Gateway
- VPN Gateway
- Azure Firewall
- Application Gateway
- Load Balancers
- Recovery Services Vault with protected items
- Private Endpoints
- Log Analytics with high ingestion volume

## Low-Risk Initial Resources

The following resources are acceptable for early phases if properly tagged and reviewed:

- Resource Groups
- Virtual Networks
- Subnets
- Network Security Groups
- Route Tables
- Empty Storage Accounts
- Basic Log Analytics Workspace with minimal ingestion

## Mandatory Tags

All Terraform-created resources must include the following tags:

- project
- environment
- owner
- cost_center
- managed_by
- lifecycle

## Budget Strategy

A low monthly Azure budget should be configured before deploying billable resources.

Recommended budget:

- Amount: 10 USD
- Alerts: 50%, 80%, 100%
- Scope: subscription
- Purpose: detect unexpected spend early

## Destroy Policy

Every lab phase that creates Azure resources must include:

1. terraform plan
2. terraform apply
3. validation
4. documentation
5. terraform destroy
6. post-destroy verification

## Portal vs CLI Usage

The Azure Portal may be used for billing, budget visibility, credit verification and account-level cost management.

Azure CLI may be used for validation, subscription checks and operational queries.

Terraform must be used for infrastructure deployment whenever possible.

## Interview Value

This cost control policy demonstrates that the project is not only focused on deploying Azure resources, but also on operating them responsibly using enterprise infrastructure practices.
