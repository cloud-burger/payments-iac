resource "aws_db_instance" "payment" {
  # Engine details
  engine               = "postgres"
  engine_version       = "16.2"
  instance_class       = var.database_instance_class

  # DB settings
  identifier            = "payment"
  db_name               = var.database_name
  username              = var.database_username
  password              = var.database_password
  allocated_storage     = 20
  max_allocated_storage = 100

  # Storage and parameter group
  storage_type            = "gp3"
  parameter_group_name    = "default.postgres16"
  db_subnet_group_name    = aws_db_subnet_group.main.name

  # Security and availability
  vpc_security_group_ids  = [aws_security_group.rds_public_sg.id]
  publicly_accessible     = true
  multi_az                = false

  # Deletion settings
  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    "Project" : "${var.project}"
    "Name" : "RDS Payment PostgreSQL"
    "Env": var.environment
  }
}