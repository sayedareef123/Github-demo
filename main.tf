provider "aws" {
  region = "us-east-2"   
}

variable "name" {
    type = string
    description = "(optional) des variable"
    default = "areef-tf"
}
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits = "2048"
}
  
 resource "aws_key_pair" "key_pair" {
  key_name = var.name
  public_key = tls_private_key.private_key.private_key_pem
  tags = {
    Name = var.name
  }
}
  