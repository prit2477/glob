# Create a VPC to launch our instances into
resource "aws_vpc" "test_vpc" {
      cidr_block = "${var.vpc_cidr}"
}
tags{
    Name = test_vpc
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "test_ig" {
  vpc_id = "${aws_vpc.test_vpc.id}"
}

#Create a Public Subnets.
 resource "aws_subnet" "publicsubnets_1" {    # Creating Public Subnets
   vpc_id =  aws_vpc.test_vpc.id
   cidr_block = "${var.public_subnets_1}"        # CIDR block of public subnets
 }
tags {
    Name = "Public_subnet"
  }

#Route table for Public Subnet's
 resource "aws_route_table" "PublicRT" {    # Creating RT for Public Subnet
    vpc_id =  aws_vpc.test_vpc.id
         route {
    cidr_block = "0.0.0.0/0"               # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.test_ig.id
     }
 }

#Route table Association with Public Subnet's
 resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.publicsubnets_1.id
    route_table_id = aws_route_table.PublicRT.id
 }





 #Create a Private Subnet                    # Creating Private Subnets
 resource "aws_subnet" "private_subnet_2" {
   vpc_id =  aws_vpc.test_vpc.id
   cidr_block = "${var.private_subnets_2}"          # CIDR block of private subnets
 }
 tags {
    Name = "private_subnet"
  }

#Route table for Private Subnet's
 resource "aws_route_table" "PrivateRT" {    # Creating RT for Private Subnet
   vpc_id = aws_vpc.test_vpc.id
   route {
   cidr_block = "0.0.0.0/0"             # Traffic from Private Subnet reaches Internet via NAT Gateway
   nat_gateway_id = aws_nat_gateway.NATgw.id
   }
 }

Route table Association with Private Subnet's
 resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.PrivateRT.id
 }


 resource "aws_eip" "nateIP" {
   vpc   = true
 }

#Creating the NAT Gateway using subnet_id and allocation_id
 resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.publicsubnets_1.id
 }
