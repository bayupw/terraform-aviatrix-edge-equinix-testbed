module "eqx-ace-aws-ec2" {
  count = var.create_aws_ec2 ? 1 : 0
  
  source  = "bayupw/amazon-linux-2/aws"
  version = "1.0.0"

  vpc_id                      = module.aws_spoke[0].vpc.vpc_id
  subnet_id                   = module.aws_spoke[0].vpc.public_subnets[0].subnet_id
  key_name                    = "aws-keypair"
  instance_hostname           = "eqx-ace-aws-ec2"
  associate_public_ip_address = true
  instance_type               = "t3.micro"

  depends_on = [module.aws_spoke]
}