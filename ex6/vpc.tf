# AWS VPC
resource "aws_vpc" "vpro-vpc" {
  cidr_block           = var.CIDR_BLOCKS["cidr_block_0"]
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name : "vprofile"
  }
}

# AWS VPC Subnets

# Public Subnet1
resource "aws_subnet" "vpro-pub-1" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_1"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone1"]
  tags = {
    Name : "vpro-pub-1"
  }
}

# Public Subnet2
resource "aws_subnet" "vpro-pub-2" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_2"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone2"]
  tags = {
    Name : "vpro-pub-2"
  }
}

# Public Subnet3
resource "aws_subnet" "vpro-pub-3" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_3"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone3"]
  tags = {
    Name : "vpro-pub-3"
  }
}

# Private Subnet1
resource "aws_subnet" "vpro-priv-1" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_4"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone1"]
  tags = {
    Name : "vpro-priv-1"
  }
}

# Private Subnet2
resource "aws_subnet" "vpro-priv-2" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_5"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone2"]
  tags = {
    Name : "vpro-priv-2"
  }
}

# Private Subnet3
resource "aws_subnet" "vpro-priv-3" {
  vpc_id                  = aws_vpc.vpro-vpc.id
  cidr_block              = var.CIDR_BLOCKS["cidr_block_6"]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONES["zone3"]
  tags = {
    Name : "vpro-priv-3"
  }
}

# AWS Internet Gateway
resource "aws_internet_gateway" "vpro-IGW" {
  vpc_id = aws_vpc.vpro-vpc.id
  tags = {
    Name = "vpro-IGW"
  }
}

# AWS Route Table
resource "aws_route_table" "vpro-pub-RT" {
  vpc_id = aws_vpc.vpro-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpro-IGW.id
  }

  tags = {
    Name = "vpro-pub-RT"
  }
}

# AWS Route Table Associations

# Association1
resource "aws_route_table_association" "vpro-pub-1-a" {
  subnet_id      = aws_subnet.vpro-pub-1.id
  route_table_id = aws_route_table.vpro-pub-RT.id
}

# Association2
resource "aws_route_table_association" "vpro-pub-2-a" {
  subnet_id      = aws_subnet.vpro-pub-2.id
  route_table_id = aws_route_table.vpro-pub-RT.id
}

# Association3
resource "aws_route_table_association" "vpro-pub-3-a" {
  subnet_id      = aws_subnet.vpro-pub-3.id
  route_table_id = aws_route_table.vpro-pub-RT.id
}
