resource "aws_server_security_group" "default" {
  name="allow http"
  description="Allow HTTP traffic"
  vpc_id = "${aws_vpc.web_vpc.id}"

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