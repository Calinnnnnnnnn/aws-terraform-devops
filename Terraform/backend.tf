terraform {
  backend "s3" {
    bucket         = "calin-tfstate-devops-project"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "tf-lock-devops"
    encrypt        = true
  }
}
