resource "null_resource" "key" {
  


provisioner "local-exec" {
    command= "sudo su"
    command= "keyname=testserver"
    command=    "keymail=devops@testserver.com"
    command="ssh-keygen -t rsa -b 4096 -f $keyname -C $keymail"
    }
  }