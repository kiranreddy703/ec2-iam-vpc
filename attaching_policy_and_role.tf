resource "aws_iam_policy_attachment" "s3-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.s3-full.arn}"
}
resource "aws_iam_policy_attachment" "ec2-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.ec2full.arn}"
}
