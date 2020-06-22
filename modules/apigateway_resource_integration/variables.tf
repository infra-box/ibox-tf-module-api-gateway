variable "api_gateway_http_method" {}
variable "alb_endpoint" {}
variable "uri_resource_service_name" {}
variable "api_gateway_integration_type" {}
variable "api_gateway_path_part" {}
variable "api_gateway_method_integration_http_method" {}
variable "api_gateway_resource_id" {}
variable "api_gateway_rest_api_id" {}

variable "api_gateway_authorization" {
  default = "NONE"
}
variable "protocol" {
  default = "http"
}
variable "connection_type" {
  default = "INTERNET"
}
variable "api_gateway_credentials" {
  default = ""
}
variable "api_gateway_request_parameters" {
  default = {}
}
variable "api_gateway_integration_request_parameters" {
  default = {}
}
variable "api_gateway_authorizer_id" {
  default = null
}
variable "api_gateway_authorization_scopes" {
  default = null
}
variable "api_gateway_integration_request_templates" {
  default = null
}
variable "api_gateway_integration_passthrough" {
  default = null
}
variable "lambda_function_name" {
  default = null
}
variable "region" {
  default = null
}
variable "account_id" {
  default = null
}
variable "connection_id" {
  default = null
}