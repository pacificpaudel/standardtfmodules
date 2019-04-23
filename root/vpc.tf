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