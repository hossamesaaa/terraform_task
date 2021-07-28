resource "aws_db_instance" "RDS" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "hossam"
  password             = "hossamesaa"
  #parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  
  vpc_security_group_ids = [var.RDS_security_group]
  db_subnet_group_name = aws_db_subnet_group.default.id
  
   tags = {
    Name = "${var.name_tag}-${var.environment}-RDS"
  }
  
  }
  
  resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.aws_subnet_private3, var.aws_subnet_private4]

  tags = {
    Name = "My_DB_subnet_group"
  }
}