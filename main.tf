provider "aws" {
  region = "us-east-1"   
}

variable "name" {
    type = string
    description = "(optional) des variable"
    default = "areefs"
}

resource "tls_private_key" "private_key" {
    account = 0
  algorithm = "RSA"
  rsa_bits = "2048"
}
  
 resource "aws_key_pair" "key_pair" {
    account = 0
  key_name = var.name
  public_key = tls_private_key.private_key.[0]public_key_openssh
  tags = {
    Name = var.name
  }
 }