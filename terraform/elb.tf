resource "aws_elb" "exp_test_elb" {
  name               = "exp-test-elb"
  subnets = ["${aws_subnet.exp_test_subnet_pub.id}"]
  security_groups = ["${aws_security_group.load_balancer.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  instances                   = ["${aws_instance.exp_test_ec2.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "exp_test_elb"
  }
}

output "elb-dns-name" {
  value = "${aws_elb.exp_test_elb.dns_name}"
}
