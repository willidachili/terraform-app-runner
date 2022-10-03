resource "aws_apprunner_service" "example" {
  service_name = "${var.prefix}-service"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner-service-role.arn
    }

    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = var.image
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
  tags = {
    Name = "example-apprunner-service"
  }
}

resource "aws_iam_role" "apprunner-service-role" {
  name               = "${var.prefix}-AppRunnerECRAccessRole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.apprunner-service-assume-policy.json
}

resource "aws_iam_role_policy_attachment" "apprunner-service-role-attachment" {
  role       = aws_iam_role.apprunner-service-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

data "aws_iam_policy_document" "apprunner-service-assume-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["build.apprunner.amazonaws.com"]
    }
  }
}