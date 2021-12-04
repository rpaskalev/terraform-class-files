/*
resource "aws_ssm_parameter" "foo" {
  name  = "/github_token"
  type  = "SecureString"
  value = "50b8150dcec7149c78bf6baabf65f55d041d457c"
}
*/
 data "aws_ssm_parameter" "git-token" {
   name = "github_token"
 }