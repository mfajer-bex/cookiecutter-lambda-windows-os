{%- if cookiecutter.environment == "abs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "production"
vpc_subnet_ids                    = ["subnet-064dabe55e1653298", "subnet-0b64d8a4ab1e46409"]
vpc_security_group_ids            = ["sg-01e4da31c0b768f71"]
artifact_bucket                   = "bexmoney-abs-euw2-abs-production-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 90
{%- elif cookiecutter.environment == "cbs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "production"
vpc_subnet_ids                    = ["subnet-064dabe55e1653298", "subnet-0b64d8a4ab1e46409"]
vpc_security_group_ids            = ["sg-0f91e19ce01f0cd48"]
artifact_bucket                   = "bexmoney-cbs-euw2-cbs-production-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 90
{%- elif cookiecutter.environment == "cds" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "production"
vpc_subnet_ids                    = ["subnet-064dabe55e1653298", "subnet-0b64d8a4ab1e46409"]
vpc_security_group_ids            = ["sg-0f649f253a3bf4df9"]
artifact_bucket                   = "bexmoney-cds-euw2-cds-production-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 90
{%- endif -%}