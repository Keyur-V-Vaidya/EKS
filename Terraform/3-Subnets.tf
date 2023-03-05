##### To meet the requirements of EKS, we need 2 public and 2 private Subnets

##### First Private Subnet

resource "aws_subnet" "private-us-east-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"             # Required by K8S to discover subnets where private LoadBalancers will be created
    "kubernetes.io/cluster/demo"      = "owned"
  }
}


# Second Private Subnet just in different AZ

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"                    # The last IP of the CIDR block in above Subnet is 10.0.31.0/255, so that's why we used this CIDR
  availability_zone = "us-east-1b"

  tags = {
    "Name"                            = "private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1a"                # Same as the first private subnet 
  map_public_ip_on_launch = true                        # Only need this if you require public K8S instance group

  tags = {
    "Name"                       = "public-us-east-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true 

  tags = {
    "Name"                       = "public-us-east-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}