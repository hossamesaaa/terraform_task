
###################EC2#########################
resource "aws_security_group" "EC2" {
  name        = "EC2"
  vpc_id      = var.aws_vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  =[aws_security_group.ALB.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name_tag}-${var.environment}-ec2"
  }
}


###################ALB#########################
resource "aws_security_group" "ALB" {
  name        = "ALB"
  vpc_id      = var.aws_vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name_tag}-${var.environment}-alb"
  }
}


###################RDS#########################
resource "aws_security_group" "RDS" {
  name        = "RDS"
  vpc_id      = var.aws_vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
   security_groups  =[aws_security_group.EC2.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name_tag}-${var.environment}-rds"
  }
}

#######################################################