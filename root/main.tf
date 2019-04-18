# for github

# Provider configuration
provider "aws" {
  #changing this will loose complete stack of infrastructure
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


module "securitygroup" {
  source = "./securitygroup"
  #vpc_id="${aws_vpc.my_vpc.id}"
  #subnet_id="${aws_vpc.my_vpc.id}"
  #name="name"
}

