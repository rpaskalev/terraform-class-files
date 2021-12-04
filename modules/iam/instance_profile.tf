resource "aws_iam_instance_profile" "codebuild_profile" {
  name = "codededeploy"
  role = aws_iam_role.deploy_role.name
}

resource "aws_iam_role" "deploy_role" {
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
}


resource "aws_iam_policy" "codedeploy-policy" {
  name = "codedeploy"
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket",
                "s3:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.deploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}
