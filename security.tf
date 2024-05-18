module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sonarmaven-SG"
  description = "Security Group for sonar-maven Server"

  ingress_with_cidr_blocks = [
    {
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "sonarmaven-SG"
  }
}
