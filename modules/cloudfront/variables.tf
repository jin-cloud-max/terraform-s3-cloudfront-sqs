variable "origin_id" {
  type        = string
  description = "S3 ID"
}

variable "bucket_domain_name" {
  type        = string
  description = "S3 Domain Name"
}

variable "cdn_price_class" {
  type        = string
  description = "CloudFront Price Class"
  default     = "PriceClass_All"
}

variable "cdn_tags" {
  type        = map(string)
  description = "CloudFront Tags"
  default     = {}
}