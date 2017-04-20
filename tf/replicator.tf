module "replicator_function" {
  source = "./nodejs_lambda"
  name   = "replicator_js"

  role = "${aws_iam_role.iam_for_lambda.arn}"

  environment = {
    Role = "${aws_iam_role.iam_for_lambda.arn}"
  }
}

module "replicator_path" {
  source      = "./endpoint"
  name        = "replicator_js"
  arn         = "${module.replicator_function.arn}"
  region      = "${var.region}"
  accountId   = "${var.accountId}"
  rest_api_id = "${aws_api_gateway_rest_api.quines.id}"
  root_id     = "${aws_api_gateway_rest_api.quines.root_resource_id}"
}
