resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3-access-profile-${var.environment}"
  role = aws_iam_role.ec2_s3_role.name
}

#######################################################

resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2_s3_role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_access_policy-${var.environment}"
  path        = "/"
  description = "My test policy to give ec2 instance access to s3 in ${var.environment} environment"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "${var.s3_bucket}",
          "${var.s3_bucket}/*",
        ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ec2_role_attach" {
  name       = "ec2-attachment-${var.environment}"
  roles      = [aws_iam_role.ec2_s3_role.name]
  policy_arn = aws_iam_policy.s3_access_policy.arn
}