terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "ch2022-s3-bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

module "s3_bucket2" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "ch2022-s3-bucket-new"
  acl    = "private"

  versioning = {
    enabled = false
  }

}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

