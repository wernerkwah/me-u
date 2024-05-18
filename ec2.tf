module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "sonar-maven-server"

  instance_type               = var.instance_type
  key_name                    = var.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.sg.security_group_id]
  associate_public_ip_address = true
  user_data                   = file("sonar-maven.sh")

  tags = {
    Name        = "sonarmaven-Server"
    Terraform   = "true"
    Environment = "dev"
  }
}
