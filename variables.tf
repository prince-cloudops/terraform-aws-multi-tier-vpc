variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project prefix for resource tagging"
  type        = string
  default     = "enterprise-hybrid-vpc"
}

variable "vpc_cidr" {
  description = "Master VPC CIDR block"
  type        = string
  default     = "10.20.0.0/16"
}

variable "azs" {
  description = "Availability Zones for high availability"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "Public tier subnet CIDRs"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  description = "Private application tier subnet CIDRs"
  type        = list(string)
  default     = ["10.20.11.0/24", "10.20.12.0/24"]
}

variable "isolated_db_subnet_cidrs" {
  description = "Isolated database tier subnet CIDRs"
  type        = list(string)
  default     = ["10.20.21.0/24", "10.20.22.0/24"]
}

variable "onprem_cidr" {
  description = "Simulated on-premises office CIDR for VPN SSH access"
  type        = string
  default     = "192.168.10.0/24"
}
