resource "aws_instance" "webserver" {
  ami           = "ami-005383956f2e5fb96"
  instance_type = "t2.micro"
}