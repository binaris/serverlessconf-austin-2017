# API Gateway

resource "aws_api_gateway_rest_api" "quine_api" {
  name = "quine_api"
}

resource "aws_api_gateway_deployment" "stage" {
#  depends_on = [
#    "aws_api_gateway_method.method",
#    "aws_api_gateway_integration.integration",
#  ]

  rest_api_id = "${aws_api_gateway_rest_api.quine_api.id}"
  stage_name  = "api"
}

output "url" {
  value = "https://${aws_api_gateway_deployment.stage.rest_api_id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.stage.stage_name}"
}
