# for github

# Provider configuration
provider "aws" {
  region="eu-west-1"
}



# Resource configuration

resource "aws_instance" "server" {
  ami           = "ami-08935252a36e25f85"
  instance_type = "t2.micro"

  tags {
    Name = "static-web-server"
  }
}

#create a VPC if you don't want to use defualt otherwise AWS creates a default VPC while creating instances
resource "aws_vpc" "web_vpc" {
  cidr_block="10.0.0.0/16"
  }
