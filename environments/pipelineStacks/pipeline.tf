variable "buildspecpath" {
  default = "buildspec.yml"
  type    = string
}

variable "GitHubBranch" {
  default = "feature/modules"
  type    = "string"
}

variable "GitHubOwner" {
  default = "rpaskalev"
  type    = "string"
}

variable "GitHubRepo" {
  default = "terraform-class-files"
  type    = "string"
}

variable "GitHubToken" {
  type = "string"
  default = null
}

resource "aws_codepipeline" "codepipeline" {
  name     = "tf-test-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.example.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.GitHubOwner
        Repo       = var.GitHubRepo
        Branch     = var.GitHubBranch
        OAuthToken = data.aws_ssm_parameter.git-token.value #var.GitHubToken
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = "codebuild-project"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        #ActionMode     = "REPLACE_ON_FAILURE"
        #Capabilities   = "CAPABILITY_AUTO_EXPAND,CAPABILITY_IAM"
        #OutputFileName = "CreateStackOutput.json"
        #role_arn = aws_iam_role.deploy_role.arn
        ApplicationName     = "MyDemoApplication"
        DeploymentGroupName = "MyDemoDeploymentGroup"
        #StackName      = "MyStack"
        #TemplatePath   = "build_output::sam-templated.yaml"
      }
    }
  }
}