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
resource "aws_instance" "Terraform-elb" {
  ami           = "ami-0f62d9254ca98e1aa"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-elb"
  }
}
# Create a new load balancer
resource "aws_elb" "myelb" {
  name               = "terraformelb"
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.Terraform-elb.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraformelb"
  }
}
