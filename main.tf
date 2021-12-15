# Main VPC

resource "aws_vpc" "Project6-VPC" {
  cidr_block       = var.Vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "project-6th-vpc"
  }
}

# Public Subnet 1

resource "aws_subnet" "Public-Subnet-1" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.Public-Subnet-1-cidr
availability_zone = "eu-west-1b"
  tags = {
    Name = "public-subnet-1"
  }
}

# Public Subnet 2
resource "aws_subnet" "Public-Subnet-2" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.Public-Subnet-2-cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = "public-subnet-2"
  }
}

# Private Subnet 1

resource "aws_subnet" "Private-Subnet-1" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.Private-Subnet-1-cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "private-subnet-1"
  }
}

# Private Subnet 2
resource "aws_subnet" "Private-Subnet-2" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.Private-Subnet-2-cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = "private-subnet-2"
  }
}

# Public Route Table

resource "aws_route_table" "Public-Route-Table" {
  vpc_id = aws_vpc.Project6-VPC.id



  tags = {
    Name = "public-route-table"
  }
}

# Private Route Table

resource "aws_route_table" "Private-Route-Table" {
  vpc_id = aws_vpc.Project6-VPC.id


  tags = {
    Name = "private-route-table"
  }
}

# Association of Public Subnet 1 with Public Route Table

resource "aws_route_table_association" "Public-Subnet-1-Association-With-RT" {
  subnet_id      = aws_subnet.Public-Subnet-1.id
  route_table_id = aws_route_table.Public-Route-Table.id
}

# Association of Public Subnet 2 with Public Route Table

resource "aws_route_table_association" "Public-Subnet-2-Association-With-RT" {
  subnet_id      = aws_subnet.Public-Subnet-2.id
  route_table_id = aws_route_table.Public-Route-Table.id
}

# Association of Private Subnet 1 with Private Route Table

resource "aws_route_table_association" "Private-Subnet-1-Association-With-RT" {
  subnet_id      = aws_subnet.Private-Subnet-1.id
  route_table_id = aws_route_table.Private-Route-Table.id
}

# Association of Private Subnet 2 with Private Route Table

resource "aws_route_table_association" "Private-Subnet-2-Association-With-RT" {
  subnet_id      = aws_subnet.Private-Subnet-2.id
  route_table_id = aws_route_table.Private-Route-Table.id
}

# Internet Gateway

resource "aws_internet_gateway" "Project6-IGW" {
  vpc_id = aws_vpc.Project6-VPC.id

  tags = {
    Name = "project6-IGW"
  }
}

# Internet Gateway Association with Public Route Table

resource "aws_route" "IGW-Assoc-With-Pub-RT" {
  route_table_id            = aws_route_table.Public-Route-Table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Project6-IGW.id
}

