resource "aws_iam_policy" "s3-full" {
  name        = "s3full-policy"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}
resource "aws_iam_policy" "ec2full" {
  name        = "ec2full-policy"
  description = "A test policy"
  policy      = "${file("ec2-full.json")}"
}
