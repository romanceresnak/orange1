resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
}

resource "aws_eip" "nat" {}