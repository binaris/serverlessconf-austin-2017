# API Gateway

resource "aws_api_gateway_rest_api" "quines" {
  name = "quines"
}

resource "aws_api_gateway_deployment" "dev" {
  rest_api_id = "${aws_api_gateway_rest_api.quines.id}"
  stage_name  = "dev"

  depends_on = [
    "module.quine_js_path",
    "module.quine_py_path",
    "module.replicator_path",
  ]

  # See https://github.com/hashicorp/terraform/issues/6613
  stage_description = "${timestamp()}"
}

output "url" {
  value = "https://${aws_api_gateway_deployment.dev.rest_api_id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.dev.stage_name}"
}
