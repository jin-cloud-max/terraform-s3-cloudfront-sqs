output "bucket_domain_name" {
    value = data.aws_s3_bucket.bucket.bucket_domain_name
    sensitive = false
    description = "Bucket Domain Name"
}

output "origin_id" {
    value = data.aws_s3_bucket.bucket.id
    sensitive = false
    description = "S3 Origin ID"
}