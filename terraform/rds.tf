resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${aws_subnet.exp_test_subnet_priv2.id}", "${aws_subnet.exp_test_subnet_priv.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}



resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "exptestdb"
  username             = "experian"
  password             = "experian"
  parameter_group_name = "default.mysql5.7"
  availability_zone    = "us-east-1a"
  db_subnet_group_name = "main"
  vpc_security_group_ids = ["${aws_security_group.rds_database.id}"]
  skip_final_snapshot  = true 
}
