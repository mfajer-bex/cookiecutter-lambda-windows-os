# README for {{ cookiecutter.function_name|lower|replace(" ","-") }} lambda function

## Summary

This lambda is a part of `{{ cookiecutter.service_name|lower|replace(" ","-") }}` service.

## Developer Guide

> **first time deployment**
> Run `cp github/dev.lambda.{{ cookiecutter.service_name|lower|replace(" ","-") }}.{{ cookiecutter.function_name|lower|replace(" ","-") }}.yml ../../.github/workflows/`
> It will add this lambda function to the Github Action CI/CD pipeline.

1. `make build` to build the lambda function locally
2. `make run` to run the lambda function locally (`ctrl + c` to stop the running instance)
3. `make test` to invoke the lambda function locally

## CI/CD

This function will be built automatically at push event on the CI enabled branch (by default `dev`). You can make adjustments manually in the AWS console however it will be overwritten unless neccessary configuration changes are made via the Git repository.