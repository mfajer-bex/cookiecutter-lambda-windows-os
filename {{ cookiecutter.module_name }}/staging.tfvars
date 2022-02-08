{%- if cookiecutter.environment == "abs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-0b288de4bc327c4fb"]
artifact_bucket                   = "bexmoney-abs-euw2-abs-staging-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- elif cookiecutter.environment == "cbs" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-0229085e02daab24f"]
artifact_bucket                   = "bexmoney-cbs-euw2-cbs-staging-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- elif cookiecutter.environment == "cds" -%}
aws_region                        = "eu-west-2"
deployment_environment            = "dev"
vpc_subnet_ids                    = ["subnet-07c8c7d0371ae6b87", "subnet-0b628a44fd0a68812"]
vpc_security_group_ids            = ["sg-030622711b168ab3a"]
artifact_bucket                   = "bexmoney-cds-euw2-cds-staging-environment-lambda-artifacts"
cloudwatch_logs_retention_in_days = 7
{%- endif -%}