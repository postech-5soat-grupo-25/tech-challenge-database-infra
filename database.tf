resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = [
    "subnet-02a68510da8f7876e",
    "subnet-00fcc4c2802a1e51a",
    "subnet-02d8debeb44abc647"
    ]
}

resource "aws_db_parameter_group" "db_parameters" {
  name        = "db-parameters"
  family      = "postgres15"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }
  parameter {
    name  = "password_encryption"
    value = "MD5"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "tech-challenge-db"
  engine                 = "postgres"
  username               = "mainuser"
  password               = "mainpassword"
  db_name                = "TechChallengeDb"
  allocated_storage      = 10
  engine_version         = "15.6"
  instance_class         = "db.t3.micro"
  parameter_group_name   = aws_db_parameter_group.db_parameters.name
  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  storage_type           = "gp2"
  skip_final_snapshot    = true

  depends_on = [ aws_db_subnet_group.db_subnet_group ]
}
