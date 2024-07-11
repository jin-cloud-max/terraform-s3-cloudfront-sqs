variable "terraform_state_bucket" {
  type        = string
  default     = "rocktseat-state-bucket-tf-jin"
  description = "The name of the S3 bucket to store the Terraform state file"
}
