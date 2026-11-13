# Terraform Multi-Tier Hybrid Cloud VPC

## Overview
Infrastructure-as-Code (IaC) module provisioning a fault-tolerant, 3-tier AWS VPC (10.20.0.0/16) across multiple Availability Zones with chained Security Groups and hybrid VPN routing readiness.

## File Structure
- providers.tf: Terraform and AWS provider version constraints
- variables.tf: Parameterized CIDR blocks, Availability Zones, and on-premises VPN CIDR
- vpc.tf: VPC, Internet Gateway, Multi-AZ NAT Gateways, 6 tiered subnets, and route tables
- security.tf: Zero-trust Security Group chaining (ALB -> App Tier -> Isolated DB Tier)
- outputs.tf: Exported VPC, subnet, and security group identifiers

## Validation & Local Execution
```bash
terraform fmt
terraform init -backend=false
terraform validate
```
