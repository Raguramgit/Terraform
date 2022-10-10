resource "aws_s3_bucket" "Terraform" {
  bucket = "terraform${var.test}"
  acl = "private"

  tags = {
    Name        = var.test
    Environment = var.Environment
  }
}