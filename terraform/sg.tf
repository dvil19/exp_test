resource "aws_security_group" "webservers" {
  name        = "allow_http_web"
  description = "Allow http inbound traffic from load balancer"
  vpc_id      = "${aws_vpc.exp_test_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 8080
    security_groups = ["${aws_security_group.load_balancer.id}"]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "load_balancer" {
  name        = "allow_http_elb"
  description = "Allow http inbound traffic to load balancer"
  vpc_id      = "${aws_vpc.exp_test_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_database" {
  name        = "allow-rds"
  description = "Allow http inbound traffic to rds"
  vpc_id      = "${aws_vpc.exp_test_vpc.id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    security_groups = ["${aws_security_group.webservers.id}"]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
