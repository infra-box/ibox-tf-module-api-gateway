variable "environment" {
  description = "Resource environment"
}
variable "api_name" {
  description = "Api gateway name identifier"
}
variable "prefix" {
  description = "Company identifier"
}
variable "type" {
  default = "EDGE"
}
variable "vpc_endpoint_id" {
  default = null
}
