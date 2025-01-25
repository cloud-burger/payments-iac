resource "aws_security_group" "rds_public_sg" {
  name        = "rds_public_sg"
  description = "Allow postgres inbound traffic"
  vpc_id      = local.aws_vpc_id

  # Allow inbound traffic only on required ports
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}