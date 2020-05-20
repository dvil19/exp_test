resource "aws_instance" "exp_test_ec2" {
  ami           = "ami-0348bbf848e6e7430" 
  instance_type = "t2.micro"

  #subnet_id = "${aws_subnet.exp_test_subnet_pub.id}"
  subnet_id = "${aws_subnet.exp_test_subnet_priv.id}"
  security_groups = ["${aws_security_group.webservers.id}"]
  key_name = "exp_key"

  credit_specification {
    cpu_credits = "unlimited"
  }
}
