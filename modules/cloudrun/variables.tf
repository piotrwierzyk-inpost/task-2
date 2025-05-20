variable "project" {
  type        = string
  description = "GCP project ID"
}

variable "region"  {
  type        = string
  description = "GCP region"
}

variable "env"     {
  type        = string
  description = "Environment (dev/prd)"
  default     = "dev"
}

variable "db_connection_name" {
  description = "Cloud SQL connection name"
  type = string
}

variable "db_user" {
  type = string
  description = "name of DB user"
}
variable "db_pass" {
  type = string
  description = "password of DB user"
}

variable "vpc_connector_name" {
  type = string
  description = "name of VPC connector"
}

variable "bucket_name" {
  type = string
  description = "name of GCS bucket"
}
