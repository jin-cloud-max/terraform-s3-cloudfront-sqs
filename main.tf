module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "rocketseat-iac-jin"
  s3_tags = {
    Name      = "rocketseat-iac-jin-${terraform.workspace}"
    Context   = terraform.workspace
    IaC       = true
    CreatedBy = "Terraform"
  }
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.origin_id
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = "PriceClass_200"
  cdn_tags = {
    IaC       = true
    CreatedBy = "Terraform"
    Context   = terraform.workspace
  }
  depends_on = [
    module.s3
  ]
}

module "sqs" {
  source     = "terraform-aws-modules/sqs/aws"
  name       = "rocketseat-iac-sqs-${terraform.workspace}"
  create_dlq = true

  tags = {
    IaC       = true
    CreatedBy = "Terraform"
    Context   = terraform.workspace
  }
}