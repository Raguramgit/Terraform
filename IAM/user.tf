resource "aws_iam_user" "IAM" {
  name = "Refus"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
    Department = "Devops"
  }
}
resource "aws_iam_access_key" "IAMkey" {
  user = aws_iam_user.IAM.name
}
resource "aws_iam_user_policy" "IAM_policy" {
  name = "Rufus_policy"
  user = aws_iam_user.IAM.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}