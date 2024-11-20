variable "bucket_name" {
  description = "The name of the S3 bucket"
}

variable "environment" {
  description = "Environment tag for the bucket"
  default     = "production"
}
