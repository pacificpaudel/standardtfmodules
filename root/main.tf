




# for github

# Provider configuration
provider "aws" {
  #changing this will loose complete stack of infrastructure
  region="${var.aws_region}"

}



module "provisioner" {
  source = "./provisioner"
  
}

resource "template_file" "web_userdata" {
  template = "${file("web_userdata.tpl")}"

  vars {
    domain_name = "testsite"
  }
}
# Resource configuration
resource "aws_instance" "prod-web" {
  
  count     = 1
  user_data = "${template_file.web_userdata.rendered}"

  connection {
    user = "ubuntu"
  }

  tags {
    Name = "prod-web-${count.index + 1}"
  }

  instance_type          = "t2.micro"

  key_name               = "${aws_key_pair.auth.id}"
  ami                    = "${lookup(var.aws_amis, var.aws_region)}"

  vpc_security_group_ids = ["${aws_security_group.external.id}", "${aws_security_group.internal.id}"]
  subnet_id              = "${aws_subnet.production-1a.id}"
}











