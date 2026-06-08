# Phase 01 - Terraform Foundation: Resource Groups

## Purpose

This phase creates the initial Azure foundation Resource Groups using Terraform.

The goal is to establish a clean resource organization model with consistent naming, mandatory tags and environment separation before deploying networking, monitoring or compute resources.

## Business Problem Solved

In enterprise Azure environments, Resource Groups provide a logical boundary for:

- Resource lifecycle management
- Ownership
- Cost tracking
- RBAC delegation
- Operational troubleshooting
- Environment separation
- Governance and policy assignment

Creating Resource Groups through Terraform ensures the foundation is repeatable, auditable and version-controlled.

## Resources Created

The following Resource Groups were created in the dev environment:

| Resource Group | Purpose | Region |
|---|---|---|
| rg-network-dev-weu-001 | Network foundation resources | westeurope |
| rg-management-dev-weu-001 | Management and administrative resources | westeurope |
| rg-monitoring-dev-weu-001 | Monitoring and observability resources | westeurope |

## Naming Convention

The naming pattern used is:

```text
rg-<workload>-<environment>-<region>-<instance>
