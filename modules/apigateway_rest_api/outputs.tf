output "api_rest_arn" {
  value = aws_api_gateway_rest_api.this.arn
}
output "api_rest_id" {
  value = aws_api_gateway_rest_api.this.id
}
output "api_rest_root_id" {
  value = aws_api_gateway_rest_api.this.root_resource_id
}