terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 3.45"
      configuration_aliases = [aws.use1, aws.euw2]
    }
  }

  backend "s3" {
    # backend configuration is passed via TF_CLI_ARGS_init environment variable
    key     = "services/{{ cookiecutter.service_name|lower|replace(' ','_') }}/lambda/{{ cookiecutter.function_name|replace(' ','-') }}/terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  default_tags {
    tags = {
      terraform_managed = "true"
      environment       = var.deployment_environment
      service           = "{{ cookiecutter.service_name|lower|replace(' ','_') }}"
    }
  }
  region = var.aws_region
}

provider "aws" {
  default_tags {
    tags = {
      terraform_managed = "true"
      environment       = var.deployment_environment
      service           = "{{ cookiecutter.service_name|lower|replace(' ','_') }}"
    }
  }
  alias  = "euw2"
  region = "eu-west-2"
}

provider "aws" {
  default_tags {
    tags = {
      terraform_managed = "true"
      environment       = var.deployment_environment
      service           = "{{ cookiecutter.service_name|lower|replace(' ','_') }}"
    }
  }
  alias  = "use1"
  region = "us-east-1"
}