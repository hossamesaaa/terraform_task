###########private1 routing table#################
resource "aws_route_table" "private1" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }


  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-private"
  }
}

###########private2 routing table#################
resource "aws_route_table" "private2" {
  vpc_id = var.aws_vpc_id

 
  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-private"
  }
}


###########private3 routing table#################
resource "aws_route_table" "private3" {
  vpc_id = var.aws_vpc_id

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-private"
  }
}




############public routing table#################

resource "aws_route_table" "public1" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-public"
  }
}

###################gateway#############################
resource "aws_internet_gateway" "gw" {
  vpc_id = var.aws_vpc_id

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-gw"
  }
}

###################private1 subnet assiociation#############################
resource "aws_route_table_association" "a" {
  subnet_id      = var.aws_subnet_private1
  route_table_id = aws_route_table.private1.id
}



resource "aws_route_table_association" "b" {
  subnet_id      = var.aws_subnet_private2
  route_table_id = aws_route_table.private1.id
}


###################private2 subnet assiociation#############################
resource "aws_route_table_association" "c" {
  subnet_id      = var.aws_subnet_private3
  route_table_id = aws_route_table.private2.id
}



resource "aws_route_table_association" "d" {
  subnet_id      = var.aws_subnet_private4
  route_table_id = aws_route_table.private2.id
}

###################private3 subnet assiociation#############################
resource "aws_route_table_association" "e" {
  subnet_id      = var.aws_subnet_private5
  route_table_id = aws_route_table.private3.id
}



resource "aws_route_table_association" "f" {
  subnet_id      = var.aws_subnet_private6
  route_table_id = aws_route_table.private3.id
}



###################public subnet assiociation#############################
resource "aws_route_table_association" "g" {
  subnet_id      = var.aws_subnet_public_1
  route_table_id = aws_route_table.public1.id
}



resource "aws_route_table_association" "h" {
  subnet_id      = var.aws_subnet_public_2
  route_table_id = aws_route_table.public1.id
}

######################### NAT #########################################

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = var.aws_subnet_public_1

  tags = {
    Name = "${var.name_tag}-${var.environment}-vpc-nat"
  }
}
############################elastic ip###############################
resource "aws_eip" "nat_ip" {
  vpc = true
}

