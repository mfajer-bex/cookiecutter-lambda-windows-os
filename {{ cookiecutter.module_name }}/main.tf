locals {
  service = "{{ cookiecutter.service_name|lower|replace(' ', '-') }}"
  function_name = "{{ cookiecutter.function_name|lower|replace(' ', '-') }}"
}

module "lambda" {
  source                                  = "terraform-aws-modules/lambda/aws"
  version                                 = "2.27.0"
  create_current_version_allowed_triggers = false
  function_name                           = local.function_name
  handler                                 = "{{ cookiecutter.lambda_handler|lower|replace(' ', '-') }}"
  runtime                                 = "{{ cookiecutter.lambda_runtime }}"
  create_package                          = false
  s3_existing_package = {
    bucket = var.artifact_bucket
    key    = "{{ cookiecutter.service_name|lower|replace(' ', '-') }}/{{ cookiecutter.function_name|lower|replace(' ', '-') }}.zip"
  }
  architectures                     = ["arm64"]
  memory_size                       = 128
  cloudwatch_logs_retention_in_days = 7
	{% if cookiecutter.vpc == "yes" %}
	vpc_subnet_ids = var.vpc_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  attach_network_policy = true
	{% endif %} 
  attach_policy_json = true
  policy_json        = file("iam_policy.json")

  allowed_triggers = {
    "APIGateway" = {
      service    = "apigateway"
      source_arn = "${data.aws_api_gateway_rest_api.service.execution_arn}/*/*"
    }
  }
}