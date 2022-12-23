provider "aws" {
  region = "us-east-1"   
}

variable "name" {
type = string
description = (optional) describe your variable
default = "areef-tf"
}
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits = "2048"
}
  
 resource "aws_key_pair" "areef" {
  key_name = var.name
  public_key = tls_private_key.private_key.public_key_openssh
  tags = {
    Name = var.name
  }
}
  