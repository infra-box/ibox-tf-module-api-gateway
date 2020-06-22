provider "aws" {
  profile = "maando-dev"
  region = "us-east-1"
}

module "api_gateway" {
  source             = "../modules/apigateway_rest_api"
  api_name           = "test-rest-api-${terraform.workspace}"
  environment        = "dev"
  prefix             = "maando"
  type               = "PRIVATE"
  vpc_endpoint_id    = null
  resource_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Effect : "Allow",
        Principal : "*",
        Action : "execute-api:Invoke",
        Resource : "execute-api:/*/*/*"
      }
    ]
  })
}