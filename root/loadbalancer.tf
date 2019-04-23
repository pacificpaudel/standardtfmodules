######################################
#LOAD BALANCER
resource "aws_elb" "web" {
  name            = "web-production"

  subnets         = ["${aws_subnet.production-1a.id}", "${aws_subnet.production-1c.id}", "${aws_subnet.production-1d.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  instances       = ["${aws_instance.prod-web.id}"]

  tags {
    Name = "prod-web-elb"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 20
    target              = "HTTP:80/"
    interval            = 30
  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

######################################
#load balancer sg
resource "aws_security_group" "elb" {
  name        = "elb"
  description = "Load Balancer Security Group"
  vpc_id      = "${aws_vpc.production.id}"

  tags {
    Name = "Load balancer security group"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


