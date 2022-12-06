
resource "aws_instance" "bastion" {
  ami = "ami-0eddbd81024d3fbdd"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_public_subnet.id
  associate_public_ip_address = "true"
  key_name = aws_key_pair.generated_key.key_name
  depends_on = [ aws_internet_gateway.gw ]
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "rdb" {
  ami = "ami-0eddbd81024d3fbdd"
  instance_type = "t2.micro"
  key_name = aws_key_pair.generated_key.key_name
  subnet_id = aws_subnet.my_private_subnet.id

  tags = {
    Name = "RDB"
  }
}