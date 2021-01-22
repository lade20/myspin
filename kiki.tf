provider "aws"  {
    profile = "default"
    region  = "eu-west-1"
}    

terraform {
  backend "s3" {
      bucket = "myspin2"
      key = "myspin2.tfsate"
      region = "eu-west-1"
    }
}

resource "aws_instance" "myredhat" {
    ami = "ami-032e5b6af8a711f30"
    instance_type = "t2.micro"
    key_name = "devop22"
    vpc_security_group_ids = [aws_security_group.mysecgrp1.id]

    tags = {
        Name = "redhat"
    }
}
resource  "aws_vpc" "myvpc1" {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
   
    tags = {
        Name = "myvpc1"
    }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myvpc1.id
  cidr_block = "10.0.1.0/24"

    tags = {
        Name = "subnet1"
    }
}    