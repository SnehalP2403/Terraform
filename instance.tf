module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "bastian-instance"

  instance_type          = "t2.micro"
  key_name               = "upgrad-demo"
  monitoring             = true
  vpc_security_group_ids = ["aws_security_group.security_group.id"]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
