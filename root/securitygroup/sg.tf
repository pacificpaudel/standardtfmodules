
  resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}
  resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.mainvpc.id}"


#incomming traffic
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
# outgoing traffic
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}