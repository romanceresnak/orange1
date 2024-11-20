resource "aws_vpn_gateway" "main" {
  vpc_id = var.vpc_id
}

resource "aws_customer_gateway" "main" {
  bgp_asn    = 65000
  ip_address = var.customer_ip
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id     = aws_vpn_gateway.main.id
  customer_gateway_id = aws_customer_gateway.main.id
  type               = "ipsec.1"
}
