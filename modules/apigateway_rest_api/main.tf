resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.prefix}-rest-api-${var.environment}"
  description = "API apigateway for microservice integration"
  endpoint_configuration {
    types            = [var.type]
    vpc_endpoint_ids = var.type == "PRIVATE" ? var.vpc_endpoint_id : null
  }
}