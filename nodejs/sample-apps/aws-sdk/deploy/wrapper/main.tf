module "hello-lambda-function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = ">= 2.24.0"

  architectures = compact([var.architecture])
  function_name = var.name
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  create_package         = false
  local_existing_package = "${path.module}/../../build/function.zip"

  memory_size = 384
  timeout     = 20

  environment_variables = {
    AWS_LAMBDA_EXEC_WRAPPER     = "/opt/otel-handler"
    OTEL_RESOURCE_ATTRIBUTES    = var.application_name
    OTEL_SERVICE_NAME           = var.service_name
    OTEL_TRACES_SAMPLER         = var.traces_sampler
    SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL = var.sumologic_http_traces_endpoint_url
  }

  attach_policy_statements = true
  policy_statements = {
    s3 = {
      effect = "Allow"
      actions = [
        "s3:ListAllMyBuckets"
      ]
      resources = [
        "*"
      ]
    }
  }
}

module "api-gateway" {
  source = "../../../../../utils/terraform/api-gateway-proxy"

  name                = var.name
  function_name       = module.hello-lambda-function.lambda_function_name
  function_invoke_arn = module.hello-lambda-function.lambda_function_invoke_arn
}

