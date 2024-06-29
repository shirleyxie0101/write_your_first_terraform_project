terraform {
  backend "s3" {
    bucket = "292801259362-terraform-states"
    key    = "development/service-name.tfstate"
    region = "ap-southeast-2"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }

  required_version = ">= 1.2.0"
}

# provider "aws" {
#   region  = "us-west-2"
# }

resource "aws_instance" "app_server" {
  ami           = "ami-080660c9757080771"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

