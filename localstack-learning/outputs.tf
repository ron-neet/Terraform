output "bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.learning_bucket.id
}

output "bucket_arn" {
  description = "S3 bucket ARN"
  value       = aws_s3_bucket.learning_bucket.arn
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}
