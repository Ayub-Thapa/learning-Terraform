variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used in resource naming"
  type        = string
  default     = "webapp"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Two public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Provide exactly two public subnet CIDRs."
  }
}

variable "private_subnet_cidrs" {
  description = "Two private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]

  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "Provide exactly two private subnet CIDRs."
  }
}

variable "admin_cidr" {
  description = "CIDR block allowed to SSH to web instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "web_instance_count" {
  description = "Number of web EC2 instances"
  type        = number
  default     = 2
}

variable "web_instance_type" {
  description = "EC2 instance type for web tier"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Optional EC2 key pair name for SSH"
  type        = string
  default     = null
}

variable "app_port" {
  description = "Application port exposed by web tier"
  type        = number
  default     = 80
}

variable "s3_bucket_prefix" {
  description = "Prefix used for app S3 bucket"
  type        = string
  default     = "webapp-artifacts"
}

variable "domain_name" {
  description = "Root domain for Route53 hosted zone (example.com)"
  type        = string
}

variable "app_subdomain" {
  description = "Subdomain label for the app record (e.g. app)"
  type        = string
  default     = "app"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GiB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "RDS admin username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "RDS admin password"
  type        = string
  sensitive   = true
}
