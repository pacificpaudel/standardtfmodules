
  resource "aws_vpc" "production" {
  cidr_block = "10.0.0.0/16"
}
  

resource "aws_internet_gateway" "production" {
  vpc_id = "${aws_vpc.production.id}"
}
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.production.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.production.id}"
}

resource "aws_subnet" "production-1a" {
  availability_zone       = "eu-west-1b"
  vpc_id                  = "${aws_vpc.production.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "production-1d" {
  availability_zone       = "eu-west-1a"
  vpc_id                  = "${aws_vpc.production.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "production-1c" {
  availability_zone       = "eu-west-1c"
  vpc_id                  = "${aws_vpc.production.id}"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
}
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

