variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados."
  type        = string
  default     = "us-east-1"
}

variable "AWS_DB_USERNAME" {
  description = "Nome de usuário para o administrador do banco de dados. Este usuário terá permissões totais dentro do banco de dados criado."
  type        = string
  sensitive   = true
}

variable "AWS_DB_PASSWORD" {
  description = "Senha para o administrador do banco de dados. Deve ser uma senha forte para garantir a segurança do banco de dados."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nome do banco de dados a ser criado na instância do RDS. Este nome será usado para conectar ao banco de dados."
  type        = string
  default     = "postgres"
}

variable "db_allocated_storage" {
  description = "O espaço de armazenamento alocado para o banco de dados, em gigabytes (GB). Isso define o tamanho inicial do banco de dados."
  type        = number
  default     = 10
}

variable "db_instance_class" {
  description = "O tipo de instância do RDS que define a capacidade computacional (CPU, memória). 'db.t3.micro' é adequado para ambientes de teste ou pequenas aplicações (free tier)."
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "A versão do motor do PostgreSQL a ser utilizada."
  type        = string
  default     = "15.6"
}

variable "db_parameter_group_name" {
  description = "Nome do grupo de parâmetros a ser associado com esta instância do RDS."
  type        = string
  default     = "default.postgres15"
}

variable "db_publicly_accessible" {
  description = "Booleano para controlar se a instância do banco de dados será acessível publicamente. Definido como 'false' por padrão - permite acessos apenas internamente na VPC."
  type        = bool
  default     = false
}

variable "db_security_group_id" {
  description = "O ID do grupo de segurança para o banco de dados PostgreSQL. Utilizar este ID para associar a instância do RDS ao grupo de segurança correto."
  type        = string
  default     = "sg-05b6c439440ca23b6"
}

variable "db_subnet_group_name" {
  description = "O nome do grupo de sub-redes para o banco de dados PostgreSQL. Utilizado para associar instâncias do RDS a sub-redes específicas dentro da VPC."
  type        = string
  default     = "postech-5soat-grupo-25-rds-subnet-group"
}