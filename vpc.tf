resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "172.16.10.0/24"
  availability_zone = "ap-northeast-2a"
  
  tags = {
    Name = "MyPublicSubnet"
  }
}

resource "aws_subnet" "my_private_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "172.16.20.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "MyPrivateSubnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "pub_rtb_a" {
  subnet_id = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.pub_rtb.id
}