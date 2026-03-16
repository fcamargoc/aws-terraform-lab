resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Security group inseguro"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-0df8c184d5f6ae949"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.insecure_sg.id]

  root_block_device {
    encrypted = false
  }

  tags = {
    Name = "Terraform-Example"
  }
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "mi-bucket-inseguro-cortex-test"
}