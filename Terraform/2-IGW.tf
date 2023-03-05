##### TO provide internet access to the Services, we create Internet Gateway in your VPC #####

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id                          #The VPC ID

  tags = {
    Name = "main"
  }
}