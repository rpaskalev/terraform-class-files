
resource "aws_iam_instance_profile" "s3-profile" {
  name = "s3-access-profile"
  role = aws_iam_role.s3-role.name
}
resource "aws_iam_role" "s3-role" {
  name = "test_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
  tags = {
    name = "web-tier-s3-access"
  }
}

resource "aws_iam_policy" "s3-policy" {
  name        = "s3-access-policy"
  path        = "/"
  description = "My s3 policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
          "${aws_s3_bucket.iqies_my_first_resourse.arn}",
          "${aws_s3_bucket.iqies_my_first_resourse.arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3-attach" {
  role       = aws_iam_role.s3-role.name
  policy_arn = aws_iam_policy.s3-policy.arn
}

output "iam_name" {
  value = aws_iam_role.s3-role.arn
}