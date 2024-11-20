resource "aws_security_group" "web" {
  name        = "web-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
  }
}

resource "aws_security_group" "app" {
  name        = "app-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
  }
}
