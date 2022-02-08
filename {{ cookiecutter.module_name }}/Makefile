.PHONY: build
build:
	@rm -rf build && rm -rf dist
	@mkdir build && mkdir dist
	@npm install
	@npm run build
	@cp -R node_modules ./build/
#	@cp package.json ./build/
#	@cd ./build/ && npm install --only=production && rm -rf package.json

.PHONY: package
package:
	@rm -rf dist
	@echo 'packaging lambda function - started'
	@cd ./build/ && mkdir ../dist && zip -qr ../dist/{{ cookiecutter.function_name|lower|replace(' ', '-') }}.zip .
	@echo 'packaging lambda function - completed'

.PHONY: push
push:
	@aws s3 cp ./dist/{{ cookiecutter.function_name|lower|replace(' ', '-') }}.zip s3://${LAMBDA_ARTIFACTS_BUCKET}/{{ cookiecutter.service_name|lower|replace(' ', '-') }}/{{ cookiecutter.function_name|lower|replace(' ', '-') }}.zip

.PHONY: update
update:
	@aws lambda update-function-code \
	--function-name {{ cookiecutter.function_name|lower|replace(' ', '-') }} \
	--s3-bucket ${LAMBDA_ARTIFACTS_BUCKET} \
	--s3-key {{ cookiecutter.service_name|lower|replace(' ', '-') }}/{{ cookiecutter.function_name|lower|replace(' ', '-') }}.zip

.PHONY: run
run:
	@docker run --platform linux/amd64 --rm \
	-p 9001:8080 \
	-v "$$PWD/build":/var/task:ro,delegated \
	{%- if cookiecutter.lambda_runtime == "nodejs14.x" -%}
	public.ecr.aws/lambda/nodejs:14 \
	{%- elif cookiecutter.lambda_runtime == "nodejs12.x" -%} 
	public.ecr.aws/lambda/nodejs:12 \
	{% endif %}
	{{ cookiecutter.lambda_handler }}

.PHONY: test
test:
	@curl -X POST "http://localhost:9001/2015-03-31/functions/function/invocations" \
	-d "$$(cat events/event.json)"

.PHONY: local-invoke
local-invoke:
	@echo '# invoking lambda function'
	@aws lambda invoke \
	--region eu-fake-1 \
	--endpoint http://localhost:9001 --no-sign-request \
	--function-name function \
	--payload file://./events/event.json \
	--cli-binary-format raw-in-base64-out \
	response.json
	@echo '# lambda response'
	@cat response.json
	@rm -rf response.json