resource "aws_vpc" "vpc1" {
	cidr_block = 10.0.0.0/16
	tags = {
		Name = "vpc1"
		}
}

# internet Gateway

resource "aws_internet_gateway" "igw1" {
	vpc_id = aws_vpc.vpc1.id
	tags = {
		Name = "Mygateway11"
		}
}

resource "aws_subnet" "subnet11" {
	count =
	vpc_id = aws_vpc.vpc1.id
	cidr_block = 10.0.1.0/24
	availability_zone = "us-west-1c"
	map_public_ip_on_launch = true
	tags = {
		Name = "Subnet-1"
		}
}

# Creating Route Table
resource "aws_route_table" "myroute" {
	vpc_id = aws_vpc.vpc1.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway = aws_internet_gateway.igw1.id
	}
	tags = {
		Name = "MyRoute11"
	}
}

#Subnet associate
resource "aws_route_table_association" "route_associa"{
	count = 1
	subnet_id = aws_subnet.subnet11.id
	route_table_id = aws_route_table.myroute.id
}

