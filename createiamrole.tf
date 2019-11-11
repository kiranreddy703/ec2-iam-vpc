resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "EC2-FULL-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}
