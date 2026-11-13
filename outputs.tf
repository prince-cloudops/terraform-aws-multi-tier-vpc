output "vpc_id" {
  description = "ID of the provisioned Multi-Tier VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of Public Subnet IDs across AZs"
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "List of Private Application Subnet IDs across AZs"
  value       = aws_subnet.private_app[*].id
}

output "isolated_db_subnet_ids" {
  description = "List of Isolated Database Subnet IDs across AZs"
  value       = aws_subnet.isolated_db[*].id
}

output "security_group_ids" {
  description = "Map of Tier Security Group IDs"
  value = {
    alb = aws_security_group.alb.id
    app = aws_security_group.app_tier.id
    db  = aws_security_group.db_tier.id
  }
}
