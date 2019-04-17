# for github

# Provider configuration

module "provider" {
  source = "./provider"
}

# Resource configuration

resource "aws_instance" "server" {
  ami           = "ami-08935252a36e25f85"
  instance_type = "t2.micro"

  tags {
    Name = "static-web-server"
  }
}
