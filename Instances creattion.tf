terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_instance" "Terraform" {
  ami           = "ami-0f62d9254ca98e1aa"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform"
  }
}