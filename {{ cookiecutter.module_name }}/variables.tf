data "aws_caller_identity" "current" {}

variable "aws_region" {
  description = "aws region"
  default     = "eu-west-2"
  type        = string
  validation {
    condition     = contains(["us-east-1", "eu-west-1", "eu-west-2"], var.aws_region)
    error_message = "Region must be either us-east-1, eu-west-1 or eu-west-2."
  }
}

variable "deployment_environment" {
  description = "deployment environment"
  type        = string
}

variable "artifact_bucket" {
  description = "s3_artifact_bucket"
  type        = string
}

data "aws_api_gateway_rest_api" "service" {
  name = local.service
}

variable "vpc_subnet_ids" {
  description = "vpc subnet ids for lambda to attach to"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "secgroup ids for lambda"
  type        = list(string)
}

variable "cloudwatch_logs_retention_in_days" {
  description = "cloudwatch log retention in days"
  type        = string
}