resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-adonysalves"
}

# 🔒 Desabilita ACLs (recomendado pela AWS)
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# 🚫 Bloqueia todo acesso público
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 📦 Versionamento desabilitado (como você pediu)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = "terraform-state-adonysalves"

  force_destroy = true
}
