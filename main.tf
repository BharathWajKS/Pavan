module "ec2_app" {
   source = "./modules/ec2"
 
   infra_env = var.infra_env
   infra_role = "app"
   instance_size = "t3.small"
   instance_ami = "ami-0ed9277fb7eb570c9" 
   # instance_root_device_size = 12 # Optional
   subnets = keys(module.vpc.vpc_public_subnets) # Note: Public subnets 
  # security_groups = [] # TODO: Create security groups
  # instance_root_device_size = 12 
}
 
module "ec2_worker" {
   source = "./modules/ec2"
   infra_env = var.infra_env
   infra_role = "worker"
   instance_size = "t3.large"
   instance_ami = "ami-0ed9277fb7eb570c9"
   instance_root_device_size = 50
   subnets = keys(module.vpc.vpc_private_subnets) # Note: Private subnets  
  # security_groups = [] # TODO: Create security groups
  # instance_root_device_size = 20 // 
}

module "vpc" {
  source = "./modules/vpc"
 
  infra_env = var.infra_env
 
  # Note we are /17, not /16
  # So we're only using half of the available
  vpc_cidr  = "10.0.0.0/17"
}