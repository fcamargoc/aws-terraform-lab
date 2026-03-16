provider "aws" {
  region = "us-east-1"
}

# ⚠️ VULNERABILIDAD INTENCIONAL: SSH abierto al mundo
resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Security group inseguro para prueba de Cortex"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # CRITICO: SSH expuesto a internet
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # CRITICO: RDP expuesto a internet
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

  # ⚠️ VULNERABILIDAD: EBS sin encriptación
  root_block_device {
    encrypted = false
  }

  tags = {
    Name = "Terraform-Example"
  }

  metadata_options {
    http_tokens = "required"
  }
}

# ⚠️ VULNERABILIDAD: S3 bucket completamente público
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "mi-bucket-inseguro-prueba-cortex"
}

resource "aws_s3_bucket_acl" "insecure_acl" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"  # CRITICO: bucket público
}