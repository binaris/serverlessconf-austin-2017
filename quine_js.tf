module "quine_js_lambda" {
  source = "./lambda"
  name   = "quine_js"
  role = "${aws_iam_role.iam_for_lambda.arn}"
}

module "quine_js_gw" {
  source = "./gw"
  name   = "quine_js"
  arn = "${module.quine_js_lambda.arn}"
  region = "${var.region}"
  accountId = "${var.accountId}"
  rest_api_id = "${aws_api_gateway_rest_api.quine_api.id}"
  root_id = "${aws_api_gateway_rest_api.quine_api.root_resource_id}"
}
