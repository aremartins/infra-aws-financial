variable "db_password" {
  description = "The password for the RDS MySQL instance"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "db_instance_class" {
  description = "The instance type for the RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The storage allocated for the RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "irocdb"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "admin"
}
