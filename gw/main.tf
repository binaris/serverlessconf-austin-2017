
variable "name" {} # this is the input parameter of the module
variable "arn" {} # this is the input parameter of the module
variable "region" {} # this is the input parameter of the module
variable "accountId" {} # this is the input parameter of the module
variable "rest_api_id" {}
#variable "role" {}
variable "root_id" {}

# The API

resource "aws_api_gateway_resource" "the_resource" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.root_id}"
  path_part   = "${var.name}"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${var.rest_api_id}"
  resource_id   = "${aws_api_gateway_resource.the_resource.id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = "${var.rest_api_id}"
  resource_id             = "${aws_api_gateway_resource.the_resource.id}"
  http_method             = "${aws_api_gateway_method.method.http_method}"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.arn}/invocations"
}

# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${var.arn}"
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.region}:${var.accountId}:${var.rest_api_id}/*/${aws_api_gateway_method.method.http_method}/${aws_api_gateway_resource.the_resource.path_part}"
}

resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.the_resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "MyDemoIntegrationResponse" {
  depends_on = [
    "aws_api_gateway_integration.integration",
  ]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.the_resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "${aws_api_gateway_method_response.200.status_code}"
}

#output "method" {
#  value = "aws_api_gateway_method.method"
#}
