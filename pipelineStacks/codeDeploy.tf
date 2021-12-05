
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "deploy_role" {
  name = "example-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "deploy_policy" {
  name = "deploy_policy"
  role = aws_iam_role.deploy_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_codedeploy_app" "example" {
  name = "MyDemoApplication"
}

resource "aws_sns_topic" "example" {
  name = "example-topic"
}

resource "aws_codedeploy_deployment_group" "example" {
  app_name              = aws_codedeploy_app.example.name
  deployment_group_name = "MyDemoDeploymentGroup"
  service_role_arn      = aws_iam_role.deploy_role.arn

  /*
  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "SampleApp"
    }
*/
  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "SampleApp"
  }
}