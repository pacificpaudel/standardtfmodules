# for github


# Provider configuration

module "provider" {
  source = "./provider"

}



# Resource configuration


resource "aws_instance" "server" {
    ami = "ami-07140bc02c30028bb"
    instance_type="t2.micro"

    tags {
        Name="static-web-server"

        }
}


