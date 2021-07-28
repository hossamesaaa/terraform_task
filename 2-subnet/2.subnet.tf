##################public1###################################
resource "aws_subnet" "public1" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.public_subent1_ip
  availability_zone = var.availability_zone_a


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }

}

################public2###################################
resource "aws_subnet" "public2" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.public_subent2_ip
  availability_zone = var.availability_zone_b


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }

}


#####################private1_with_nat ####################
resource "aws_subnet" "private1" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent1_ip
  availability_zone = var.availability_zone_a


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }

}

####################private2_with_nat##############

resource "aws_subnet" "private2" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent2_ip
  availability_zone = var.availability_zone_b


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}


#####################private1_without_nat###########################

resource "aws_subnet" "private3" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent3_ip
  availability_zone = var.availability_zone_a


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }

}

#####################private2_without_nat###########################
resource "aws_subnet" "private4" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent4_ip
  availability_zone = var.availability_zone_b


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

#####################private3_without_nat###########################
resource "aws_subnet" "private5" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent5_ip
  availability_zone = var.availability_zone_a


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}


#####################private4_without_nat###########################
resource "aws_subnet" "private6" {
  vpc_id            = var.aws_vpc_id
  cidr_block        = var.private_subent6_ip
  availability_zone = var.availability_zone_b


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc"
  }
}

###################################################################