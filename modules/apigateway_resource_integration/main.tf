resource "aws_api_gateway_method" "resource_method" {
  rest_api_id          = var.api_gateway_rest_api_id
  resource_id          = var.api_gateway_resource_id
  http_method          = var.api_gateway_http_method
  authorization        = var.api_gateway_authorization
  authorizer_id        = var.api_gateway_authorizer_id
  request_parameters   = var.api_gateway_request_parameters
  authorization_scopes = var.api_gateway_authorization_scopes
}

resource "aws_api_gateway_integration" "integration_method" {
  rest_api_id = var.api_gateway_rest_api_id
  resource_id = var.api_gateway_resource_id

  http_method = aws_api_gateway_method.resource_method.http_method
  uri         = var.uri_resource_service_name

  connection_type = var.connection_type
  connection_id   = var.connection_type == "INTERNET" ? null : var.connection_id

  type                    = var.api_gateway_integration_type
  integration_http_method = var.api_gateway_method_integration_http_method
  request_parameters      = var.api_gateway_integration_request_parameters
  request_templates       = var.api_gateway_integration_request_templates
  passthrough_behavior    = var.api_gateway_integration_passthrough
  credentials             = var.api_gateway_credentials
}

# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  count         = var.api_gateway_integration_type == "AWS_PROXY" ? 1 : 0
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${var.api_gateway_rest_api_id}/*/*/${var.api_gateway_path_part}"
}

resource "aws_api_gateway_method" "optionsMethod" {
  rest_api_id          = var.api_gateway_rest_api_id
  resource_id          = var.api_gateway_resource_id
  http_method          = "OPTIONS"
  authorization        = var.api_gateway_authorization
  authorizer_id        = var.api_gateway_authorizer_id
  authorization_scopes = var.api_gateway_authorization_scopes
}

resource "aws_api_gateway_integration" "optionsMethodIntegration" {
  rest_api_id = var.api_gateway_rest_api_id
  resource_id = var.api_gateway_resource_id
  http_method = aws_api_gateway_method.optionsMethod.http_method
  type        = "MOCK"  # Documentation not clear
  request_templates = { # Not documented
    "application/json" = "{'statusCode': 200}"
  }
  passthrough_behavior = "WHEN_NO_MATCH"
}