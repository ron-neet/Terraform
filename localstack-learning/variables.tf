variable "bucket_name" {
  description = "Name of the S3 Bucket"
  type        = string
  default     = "terraform-learning-bucket"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}
