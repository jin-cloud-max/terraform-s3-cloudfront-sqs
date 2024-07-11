terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }

  backend "s3" {
    bucket    = "rocktseat-state-bucket-tf-jin"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true

    profile = "jin"
  }

}

provider "aws" {
  profile = "jin"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.terraform_state_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.terraform_state
  ]
}