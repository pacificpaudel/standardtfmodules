# for github


# Provider configuration

Provider "aws" 
{
  #Instead of defining access in this place place a private key ".pem" file in your laptop and connect.
  #access_key = "XXXX"
  #secret_key = "XXXX"
  region     = "${var.provider}"
}



# Resource configuration


resource "aws_instance" "web-server" {
    ami = "ami-9bf712f4"
    instance_type="t2.micro"

    tags {
        Name="static-web-server"

        }
}


