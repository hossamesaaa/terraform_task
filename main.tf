##################vpc_module###################################
module "vpc_module_1" {
  source = "/home/ec2-user/environment/terraform_task/1-vpc"


  vpc_name_tag      = var.name_tag
  vpc_environment   = var.environment
  vpc_cidr_block_ip = var.cidr_block_ip


}


##################subnet_module###################################

module "subnet_module_1" {
  source = "/home/ec2-user/environment/terraform_task/2-subnet"


  name_tag    = var.name_tag
  environment = var.environment

  public_subent1_ip   = var.public_subent1_ip
  availability_zone_a = var.availability_zone_a

  public_subent2_ip   = var.public_subent2_ip
  availability_zone_b = var.availability_zone_b

  private_subent1_ip = var.private_subent1_ip
  private_subent2_ip = var.private_subent2_ip
  private_subent3_ip = var.private_subent3_ip
  private_subent4_ip = var.private_subent4_ip
  private_subent5_ip = var.private_subent5_ip
  private_subent6_ip = var.private_subent6_ip


  aws_vpc_id = module.vpc_module_1.myvpc_id


}

##################routes_module#####################################

module "routes_module_1" {
  source = "/home/ec2-user/environment/terraform_task/3-routes"


  name_tag    = var.name_tag
  environment = var.environment

  aws_vpc_id = module.vpc_module_1.myvpc_id

  aws_subnet_private1 = module.subnet_module_1.aws_subnet_private1
  aws_subnet_private2 = module.subnet_module_1.aws_subnet_private2
  aws_subnet_private3 = module.subnet_module_1.aws_subnet_private3
  aws_subnet_private4 = module.subnet_module_1.aws_subnet_private4
  aws_subnet_private5 = module.subnet_module_1.aws_subnet_private5
  aws_subnet_private6 = module.subnet_module_1.aws_subnet_private6

  aws_subnet_public_1 = module.subnet_module_1.aws_subnet_public1
  aws_subnet_public_2 = module.subnet_module_1.aws_subnet_public1

}



##################security_module###################################

module "security_module_1" {
  source = "/home/ec2-user/environment/terraform_task/4-security_group"


  name_tag    = var.name_tag
  environment = var.environment
  aws_vpc_id  = module.vpc_module_1.myvpc_id


}

########################EC2################################
module "EC2_module_1" {
  source = "/home/ec2-user/environment/terraform_task/5-EC2"


  name_tag    = var.name_tag
  environment = var.environment

  aws_subnet_private1 = module.subnet_module_1.aws_subnet_private1
  aws_subnet_private2 = module.subnet_module_1.aws_subnet_private2

  amazon_machine_image = var.amazon_machine_image
  EC2_security_group   = module.security_module_1.EC2_security_group
}

#####################load balancer##########################################

module "loadbalancer_module_1" {
  source = "/home/ec2-user/environment/terraform_task/6-ALB"


  name_tag    = var.name_tag
  environment = var.environment

  ALB_security_group = module.security_module_1.ALB_security_group

  aws_subnet_public_1 = module.subnet_module_1.aws_subnet_public1
  aws_subnet_public_2 = module.subnet_module_1.aws_subnet_public2

  aws_vpc_id = module.vpc_module_1.myvpc_id

  aws_instance_web1 = module.EC2_module_1.aws_instance_web1
  aws_instance_web2 = module.EC2_module_1.aws_instance_web2

}


#####################RDS##########################################

module "RDS_module_1" {
  source = "/home/ec2-user/environment/terraform_task/7-RDS"


  name_tag            = var.name_tag
  environment         = var.environment
  RDS_security_group  = module.security_module_1.RDS_security_group
  aws_subnet_private3 = module.subnet_module_1.aws_subnet_private3
  aws_subnet_private4 = module.subnet_module_1.aws_subnet_private4
}


####################################################################