# for github


# Provider configuration

module "provider" {
  source = "./provider"

}



# Resource configuration


resource "aws_instance" "web-server" {
    ami = "ami-9bf712f4"
    instance_type="t2.micro"

    tags {
        Name="static-web-server"

        }
}


