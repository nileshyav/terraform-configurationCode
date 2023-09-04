provider "aws" {
    region = "us-east-1"
  
}

# 1. Create Your VPC

resource "aws_vpc" "testing_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "terraform"
  }
}


# 2. Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.testing_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"


  tags = {
    Name = "Public"
  }
}



# 3. Create Private subnet 

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.testing_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "private"
  }
  
}


# 4. create IGW

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.testing_vpc.id
    tags = {
      Name = "internet gateway"
    }
  
}

# 5. create route table for public subnet

resource "aws_route_table" "public_RT" {
    vpc_id =  aws_vpc.testing_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "Public_RT"
    }
}




# 6. assotiate route table with subnet

resource "aws_route_table_association" "public_RT_assotiaation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_RT.id
}

