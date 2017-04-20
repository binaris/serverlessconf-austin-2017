module "zipper" {
  source = "./nodejs_lambda"
  name   = "zipper"
  role   = "${aws_iam_role.iam_for_lambda.arn}"
}
