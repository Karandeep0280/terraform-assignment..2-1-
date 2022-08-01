
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.24.0"
    }
  }
}



provider "aws"{
  region ="ap-south-1"
}
 


resource "aws_instance" "punch" {  
    instance_type = each.value.instance_type
    ami  = each.value.ami
    for_each = var.karan
    tags = {
      Name = each.value.name
      Owner= each.key
  }
}

resource "aws_instance" "punch2" {     
    instance_type = "t2.micro"
    ami  = "ami-08df646e18b182346"
    for_each = toset(var.karandeep)
    tags = {
      Name = each.key
      Owner= "Varinder"
  }
}
