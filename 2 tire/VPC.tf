resource "aws_vpc" "terraformvpc" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"

  tags = {
    Name = "terraform${var.myvpc}"
    environment = var.environment
  }
}
resource "aws_subnet" "mysubnet" {
    vpc_id     = aws_vpc.terraformvpc.id
    cidr_block = "10.0.1.0/24"
  tags = {
    Name = "terraform${var.subnet}"
    environment = var.environment
  }
}
resource "aws_internet_gateway" "mygateway" {
  vpc_id = aws_vpc.terraformvpc.id
  tags = {
    Name = "terraform${var.gateway}"
    environment = var.environment
  }
}
resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.terraformvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygateway.id
  }
  tags = {
    Name = "terraform${var.route_table}"
    environment = var.environment
  }
}
resource "aws_route_table_association" "route_asso" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.myroute.id
}
resource "aws_security_group" "mysecgroup" {
    name        = "allow_tls"
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_vpc.terraformvpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "terraform${var.mysecgroup}"
    environment = var.environment
  }
}