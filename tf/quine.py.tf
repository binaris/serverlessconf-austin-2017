module "quine_py_function" {
  source = "./python_lambda"
  name   = "lambda_quine_py"
  role   = "${aws_iam_role.iam_for_lambda.arn}"
}

module "quine_py_path" {
  source      = "./endpoint"
  name        = "lambda_quine_py"
  arn         = "${module.quine_py_function.arn}"
  region      = "${var.region}"
  accountId   = "${var.accountId}"
  rest_api_id = "${aws_api_gateway_rest_api.quines.id}"
  root_id     = "${aws_api_gateway_rest_api.quines.root_resource_id}"
}
