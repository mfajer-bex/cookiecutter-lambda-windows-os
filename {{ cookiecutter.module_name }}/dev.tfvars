{%- if cookiecutter.environment == "abs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-0ff8325767238f233"]
artifact_bucket                   = "bexmoney-abs-euw2-abs-dev-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- elif cookiecutter.environment == "cbs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-05f61b29daa3e744b"]
artifact_bucket                   = "bexmoney-cbs-euw2-cbs-dev-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- elif cookiecutter.environment == "cds" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-0ca725d0f040fd4a2"]
artifact_bucket                   = "bexmoney-cds-euw2-cds-dev-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- endif -%}