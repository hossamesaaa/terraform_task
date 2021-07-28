################first EC2################################# 
resource "aws_instance" "web1" {
  ami           = var.amazon_machine_image 
  instance_type = "t3.micro"
  key_name="mykey"
  private_ip="10.0.3.50"
  security_groups=[var.EC2_security_group]
  subnet_id=var.aws_subnet_private1
  
  tags = {
    Name = "${var.name_tag}-${var.environment}-ec1"
  }
}

################second EC2################################# 

resource "aws_instance" "web2" {
  ami           = var.amazon_machine_image 
  instance_type = "t3.micro"
  key_name="mykey"
  private_ip="10.0.4.50"
  security_groups=[var.EC2_security_group]
  subnet_id=var.aws_subnet_private2
  
  tags = {
    Name = "${var.name_tag}-${var.environment}-ec2"
  }
}