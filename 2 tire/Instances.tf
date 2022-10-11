resource "aws_instance" "publicmachine" {
  ami                         =  "ami-0f62d9254ca98e1aa"
  instance_type               =  "t2.micro"  
  subnet_id                   =  aws_subnet.mysubnet.id
  key_name                    =  "Office Laptop"
  vpc_security_group_ids      =  ["${aws_security_group.mysecgroup.id}"]
  associate_public_ip_address =  true
  tags = {
    Environment = var.environment
    Name = var.name
  }
}