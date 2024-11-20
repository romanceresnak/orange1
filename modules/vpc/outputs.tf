output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public_1.id
}