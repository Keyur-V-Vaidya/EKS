provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

##### EC2 Instance Configuration #####
# resource "aws_instance" "test-1" {
#   ami           = "ami-0dfcb1ef8550277af"
#   instance_type = "t2.micro"
# }

##### AWS VPC Configuration ###### 
# resource "aws_vpc" "EKS-VPC" {
#   cidr_block = "172.31.0.0/16"
#   tags = {
#     "Resource" = "EKS"
#   }
# }