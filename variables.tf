variable "terraform_state_bucket" {
  type        = string
  default     = "rocktseat-state-bucket-tf-jin"
  description = "The name of the S3 bucket to store the Terraform state file"
}

variable "s3_bucket_name" {
  type        = string
  default     = "rocketseat-iac-jin"
  description = "The name of the S3 bucket to create"
}

variable "sqs_queue_name" {
  type        = string
  default     = "rocktseat-sqs"
  description = "The name of the SQS queue to create"
}