
module "s3" {
  source = "./modules/aws/s3"
  s3_bucket_name = var.s3_bucket_name
  kms_alias_name = var.kms_alias_name
}

