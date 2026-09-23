resource "aws_vpc" "onepercent_vpc_tf" {
  cidr_block       = "10.16.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "onepercent_vpc"
  }
}

resource "aws_subnet" "onepercent_subnet_tf1" {
  vpc_id            = aws_vpc.onepercent_vpc_tf.id
  cidr_block        = "10.16.32.0/20"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "onepercent_subnet1"
  }
}

resource "aws_subnet" "onepercent_subnet_tf2" {
  vpc_id            = aws_vpc.onepercent_vpc_tf.id
  cidr_block        = "10.16.48.0/20"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "onepercent_subnet2"
  }
}

resource "aws_internet_gateway" "gw_one_percent" {
  vpc_id = aws_vpc.onepercent_vpc_tf.id

  tags = {
    Name = "igw-one-percent-tf"
  }
}

resource "aws_route_table" "rt_onepercent" {
  vpc_id = aws_vpc.onepercent_vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_one_percent.id
  }

  tags = {
    Name = "rt-one-percent-tf"
  }
}

resource "aws_route_table_association" "rta_one_percent_subnet1" {
  subnet_id      = aws_subnet.onepercent_subnet_tf1.id
  route_table_id = aws_route_table.rt_onepercent.id
}

resource "aws_route_table_association" "rta_one_percent_subnet2" {
  subnet_id      = aws_subnet.onepercent_subnet_tf2.id
  route_table_id = aws_route_table.rt_onepercent.id
}


# resource "aws_route_table_association" "rta_one_percent_gw" {
#   gateway_id     = aws_internet_gateway.gw_one_percent.id
#   route_table_id = aws_route_table.rt_onepercent.id
# }