resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block_ip
  tags = {
     Name = "${var.vpc_name_tag}-${var.vpc_environment}-vpc"
  }
}