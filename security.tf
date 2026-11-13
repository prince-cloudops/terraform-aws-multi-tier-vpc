# 1. Public ALB Security Group
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Allow inbound HTTP/HTTPS traffic from the internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

# 2. Private Application Tier Security Group
resource "aws_security_group" "app_tier" {
  name        = "${var.project_name}-app-sg"
  description = "Allow app traffic strictly from ALB and admin SSH via On-Prem VPN"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "App traffic from ALB Security Group"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description = "Admin SSH strictly from On-Premises VPN CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.onprem_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-app-sg"
  }
}

# 3. Isolated Database Tier Security Group
resource "aws_security_group" "db_tier" {
  name        = "${var.project_name}-db-sg"
  description = "Allow PostgreSQL traffic strictly from Private App Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "PostgreSQL from App Tier SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.project_name}-db-sg"
  }
}
