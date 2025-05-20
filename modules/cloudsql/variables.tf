variable "env" {
  type        = string
  description = "Environment (dev/prd)"
  default     = "dev"
}

variable "vpc_connection" {
  type        = any
  description = "VPC connection name"
}

variable "vpc_self_link" {
  type        = string
  description = "VPC self link"
}
