resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.prefix}-rest-api-${var.environment}"
  description = "API apigateway for microservice integration"
  binary_media_types = var.binary_media_types
  policy = var.resource_policy
  endpoint_configuration {
    types            = [var.type]
    vpc_endpoint_ids = var.type == "PRIVATE" ? var.vpc_endpoint_id : null
  }
}