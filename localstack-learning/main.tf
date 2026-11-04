terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region            = "us-east-1"
  access_key        = "test"
  secret_key        = "test"
  s3_use_path_style = true

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "learning_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_object" "learning_file" {
  bucket = aws_s3_bucket.learning_bucket.id
  key    = "documents/sample.txt"
  source = "${path.module}/sample.txt"
  etag   = filemd5("${path.module}/sample.txt")
}

resource "aws_s3_bucket_versioning" "learning_versioning" {
  bucket = aws_s3_bucket.learning_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
