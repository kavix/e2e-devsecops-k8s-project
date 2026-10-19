resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3a.xlarge"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.security-group.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.instance-profile.name

  # Root block storage customizations
  root_block_device {
    volume_size           = 30
  }


  user_data = templatefile("./tools.sh",{})

  tags = {
    Name        = "var.instance-name
  }
}
