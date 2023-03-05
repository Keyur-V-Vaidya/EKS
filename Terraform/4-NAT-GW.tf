##### It used in the private Subnet to allow services to access the Internet #####


#For NAT, we need to create and allocate a Public IP address

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id           #You need to put your Public Subnet, that must have IGW as default route

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
