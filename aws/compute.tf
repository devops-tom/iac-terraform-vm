resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ssh-keypair"
  public_key = tls_private_key.private_key.public_key_openssh
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0f5513ad02f8d23ed"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}