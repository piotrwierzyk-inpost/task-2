variable "project" {
  type        = string
  description = "GCP project ID"
  default = "inpost-devops-assessment"
}

variable "region" {
  description = "Resources region (Cloud Run, VPC, Cloud SQL)"
  type        = string
  default     = "europe-west3"        
}

variable "env" {
  type        = string
  description = "Environment (dev/prd)"
  default     = "dev"
}
