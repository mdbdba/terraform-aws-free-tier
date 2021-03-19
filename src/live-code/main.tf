module "vpc" {
  source = "../modules/vpc"
  vpc_name = "ec2_vpc_name"
}

module "public_subnet" {
  source = "../modules/public-subnet"
  subnet_availability_zone = "${var.region}c"

  vpc_id = module.vpc.vpc_id
  subnet_name = "ec2_public_subnet_name"
}

module "internet_gateway" {
  source = "../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
  internet_gateway_name = "ec2_internet_gateway_name"
}

module "route_table" {
  source = "../modules/route-table"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_id    = module.public_subnet.public_subnet_id
  route_table_name = "ec2_route_table_name"
}

module "ec2" {
  source = "../modules/ec2"

  ec2_security_group_name = "ec2_security_group_name"
  ec2_name = "ec2_name"

  vpc_id                  = module.vpc.vpc_id
  public_subnet_id        = module.public_subnet.public_subnet_id

  ec2_ssh_key_name        = var.ec2_ssh_key_name
  ec2_ssh_public_key_path = var.ec2_ssh_public_key_path
}