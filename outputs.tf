output "db_instance_endpoint" {
  description = "O endpoint de conexão para a instância do banco de dados."
  value       = aws_db_instance.postgres.endpoint
}

output "db_instance_arn" {
  description = "O ARN da instância do banco de dados RDS."
  value       = aws_db_instance.postgres.arn
}

output "db_name" {
  description = "O nome do banco de dados."
  value       = var.db_name
}

output "db_engine_version" {
  description = "A versão do motor do banco de dados."
  value       = var.db_engine_version
}
