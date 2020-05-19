resource "aws_instance" "exp_test_ec2" {
  ami           = "ami-0cbbbbadd7ab17426" 
  instance_type = "t2.micro"

  subnet_id = "${aws_subnet.exp_test_subnet_pub.id}"
  security_groups = ["${aws_security_group.webservers.id}"]

  credit_specification {
    cpu_credits = "unlimited"
  }
}
