provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "exp_test_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-exp-test"
  }
}

resource "aws_subnet" "exp_test_subnet_priv" {
  vpc_id            = "${aws_vpc.exp_test_vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-exp-test-subnet-priv"
  }
}

resource "aws_network_interface" "exp_test_vni" {
  subnet_id   = "${aws_subnet.exp_test_subnet_priv.id}"
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_internet_gateway" "exp_test_ig" {
  vpc_id = "${aws_vpc.exp_test_vpc.id}"
}


resource "aws_subnet" "exp_test_subnet_pub" {
  vpc_id = "${aws_vpc.exp_test_vpc.id}"
  cidr_block = "172.16.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-exp-test-subnet-pub"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.exp_test_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.exp_test_ig.id}"
  }
  tags = {
    Name = "publicRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.exp_test_subnet_pub.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
