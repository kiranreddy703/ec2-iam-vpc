resource "aws_iam_instance_profile" "IAM_profile" {
  name  = "IAM_profile"
  roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
}
