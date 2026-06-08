# Azure Budget Validation

## Purpose

This document records the initial Azure budget guardrail configured for the Azure Hybrid Infrastructure Lab.

The budget was created before deploying any Terraform-managed Azure resources.

## Budget Configuration

- Budget name: budget-azure-hybrid-infra-lab
- Scope: Azure subscription / personal Azure account scope
- Reset period: Monthly
- Budget amount: 10 USD
- Evaluated spend at creation: 0.00 USD
- Purpose: detect unexpected Azure spend during the lab

## Validation

At the time of validation:

- Azure CLI login was successful
- Azure subscription was enabled
- The selected subscription was configured as default
- No Azure Resource Groups existed yet
- No Terraform-managed infrastructure had been deployed

## Operational Rule

No Azure infrastructure should be deployed before confirming:

1. The correct Azure subscription is selected
2. The monthly budget exists
3. The repository is clean
4. The planned resources are reviewed
5. A destroy procedure is available

## Interview Value

This budget validation demonstrates responsible cloud operations behavior: cost guardrails were configured before deploying infrastructure.
