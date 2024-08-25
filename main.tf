# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Subnet na AZ us-east-1a
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"  
  availability_zone = "${var.region}a"
}

# Subnet na AZ us-east-1b
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.4.0/24"  
  availability_zone = "${var.region}b"
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associação da Tabela de Rotas com Subnet na AZ us-east-1a
resource "aws_route_table_association" "public_rt_assoc_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

# Associação da Tabela de Rotas com Subnet na AZ us-east-1b
resource "aws_route_table_association" "public_rt_assoc_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "rds_mysql" {
  allocated_storage    = var.allocated_storage
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.main.id
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id
  ]

  tags = {
    Name = "MainDBSubnetGroup"
  }
}
