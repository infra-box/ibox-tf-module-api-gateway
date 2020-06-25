resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.rest_id
  parent_id   = var.parent_id
  path_part   = var.path_part
  depends_on = [var.dependencies]
}