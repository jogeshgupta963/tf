terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">=1.2.0"
}

provider "aws" {
        region = "ap-south-1"
}

resource "aws_instance" "ec2_instance"{
        ami = "ami-0f8ca728008ff5af4"
        instance_type = "t2.micro"
        tags = {
                Name="tf-instance-1"
        }
}

resource "aws_s3_bucket" "s3_buket"{
        bucket = "tf-bucket-1232rkjmjofafjokaf"
        tags = {
                Name ="tf-bucket-1232rkjmjofafjokaf"
        }
}

output "ec2_public_dns" {
        value = aws_instance.ec2_instance.public_dns
}
