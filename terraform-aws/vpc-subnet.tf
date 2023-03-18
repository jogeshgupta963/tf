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



# resource "aws_s3_bucket" "s3_buket"{
#         bucket = "tf-bucket-1232rkjmjofafjokaf"
#         tags = {
#                 Name ="tf-bucket-1232rkjmjofafjokaf"
#         }
# }

# vpc
resource "aws_vpc" "vpc_custom" {
        cidr_block = "10.0.0.0/16"
        instance_tenancy = "default"
        enable_dns_support = true
        enable_dns_hostnames = true
        enable_classiclink = false
        tags ={
                Name = "vpc_custom"
        }
}
# public subnets
resource "aws_subnet" "vpc-custom-publicSubnet-1" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.1.0/24"
        map_public_ip_on_launch = true
        availability_zone = "ap-south-1a"
        tags = {
          Name = "vpc-custom-publicSubnet-1"
        }
}
resource "aws_subnet" "vpc-custom-publicSubnet-2" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.2.0/24"
        map_public_ip_on_launch = true
        availability_zone = "ap-south-1b"
        tags = {
          Name = "vpc-custom-publicSubnet-2"
        }
}
resource "aws_subnet" "vpc-custom-publicSubnet-3" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.3.0/24"
        map_public_ip_on_launch = true
        availability_zone = "ap-south-1c"
        tags = {
          Name = "vpc-custom-publicSubnet-3"
        }
}
#private subnets
resource "aws_subnet" "vpc-custom-privateSubnet-1" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.1.0/24"
        map_public_ip_on_launch = false
        availability_zone = "ap-south-1a"
        tags = {
          Name = "vpc-custom-privateSubnet-1"
        }
}
resource "aws_subnet" "vpc-custom-privateSubnet-2" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.2.0/24"
        map_public_ip_on_launch = false
        availability_zone = "ap-south-1b"
        tags = {
          Name = "vpc-custom-privateSubnet-2"
        }
}
resource "aws_subnet" "vpc-custom-privateSubnet-3" {
        vpc_id = aws_vpc.vpc_custom.id
        cidr_block = "10.0.3.0/24"
        map_public_ip_on_launch = false
        availability_zone = "ap-south-1c"
        tags = {
          Name = "vpc-custom-privateSubnet-3"
        }
}

#internet gateway
resource "aws_internet_gateway" "vpc_custom-gw" {
        vpc_id = aws_vpc.vpc_custom.id
        tags = {
          Name = "vpc_custom"
        }
}

# route tables

resource "aws_route_table" "vpc_custom_public" {
        vpc_id = aws_vpc.vpc_custom.id
        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = aws_internet_gateway.vpc_custom-gw.id
        } 
        tags = {
                Name = "vpc_custom_public_1"
        }
}

#route association public

resource "aws_route_table_association" "vpc_custom_public_1a" {
  subnet_id = aws_subnet.vpc-custom-publicSubnet-1.id
  route_table_id = aws_route_table.vpc_custom_public.id
}
resource "aws_route_table_association" "vpc_custom_public_2a" {
  subnet_id = aws_subnet.vpc-custom-publicSubnet-2.id
  route_table_id = aws_route_table.vpc_custom_public.id
}
resource "aws_route_table_association" "vpc_custom_public_3a" {
  subnet_id = aws_subnet.vpc-custom-publicSubnet-3.id
  route_table_id = aws_route_table.vpc_custom_public.id
} 