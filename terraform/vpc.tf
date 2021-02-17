resource "aws_vpc" "my_first_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc-auto"
    
  }
}