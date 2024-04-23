# Define a região da AWS onde os recursos serão criados
provider "aws" {
  region = var.aws_region
}

# Prefixo local para nomear os recursos e facilitar a identificação
locals {
  prefix = "postech-5soat-grupo-25"
}

# Cria uma instância do banco de dados PostgreSQL na AWS RDS
resource "aws_db_instance" "postgres" {
  identifier             = "${local.prefix}-rds"
  engine                 = "postgres"
  username               = var.AWS_DB_USERNAME
  password               = var.AWS_DB_PASSWORD
  db_name                = var.db_name
  allocated_storage      = var.db_allocated_storage
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  parameter_group_name   = var.db_parameter_group_name
  publicly_accessible    = var.db_publicly_accessible
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.db_security_group_id]
  storage_type           = "gp2"
  skip_final_snapshot    = true
}