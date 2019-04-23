
##### ALL sample and user datas

resource "template_file" "web_userdata" {
  template = "${file("web_userdata.tpl")}"

  vars {
    domain_name = "testsite"
  }
}