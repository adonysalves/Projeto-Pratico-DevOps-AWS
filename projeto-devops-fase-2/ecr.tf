resource "aws_ecr_repository" "ecr_site" {
  name                 = "site_prod"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "repo" {
  name         = "site_prod"
  force_delete = true
}