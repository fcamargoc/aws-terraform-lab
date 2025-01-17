
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0df8c184d5f6ae949" # Amazon Linux 2 AMI
  instance_type = "t2.small"
  tags = {
    Name = "Terraform-Example"
  }
}
