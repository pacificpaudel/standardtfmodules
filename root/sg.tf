
  
###################################################################
#internal sg
resource "aws_security_group" "internal" {
name="internal"
description="internal connection"
  vpc_id = "${aws_vpc.production.id}"

tags{
  Nmae="Internal security group"
}  

ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



########################################
#EXTERNAL security group
resource "aws_security_group" "external" {
  name        = "external"
  description = "Connection From the world"
  vpc_id      = "${aws_vpc.production.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



