# Database | PosTech 5SOAT • Grupo 25

Este repositório contém a configuração necessária para o deploy de uma infraestrutura de banco de dados PostgreSQL na AWS usando Terraform. O objetivo é automatizar a criação de uma instância segura e configurada do banco de dados PostgreSQL na AWS RDS, facilitando o gerenciamento e a manutenção da infraestrutura de banco de dados.

## Infraestrutura

A infraestrutura criada por este repositório inclui:

- Uma instância do banco de dados PostgreSQL na AWS RDS. A configuração está otimizada para se enquadrar dentro do *Free Tier* da AWS, utilizando `db.t3.micro` como classe de instância e 10GB de armazenamento alocado. *Importante:* Embora configurado para se enquadrar no Free Tier, é crucial sempre destruir os recursos após o uso para evitar custos inesperados.

## Como Utilizar

### Configuração dos Secrets

Certifique-se de ter os seguintes secrets configurados:

- A nível de **organização**:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_DEFAULT_REGION`
- A nível de **repositório**:
  - `AWS_DB_USERNAME`
  - `AWS_DB_PASSWORD`

### Deploy Automático via GitHub Actions

O deploy da infraestrutura é automatizado através de **GitHub Actions**. O processo é acionado automaticamente quando um pull request é mergeado na branch `main`. Os passos incluem:

1. *Checkout do código:* O código mais recente é baixado para o runner do GitHub Actions.
2. *Setup do Terraform:* A versão especificada do Terraform é instalada.
3. *Inicialização do Terraform:* Prepara o Terraform para o deploy, configurando o backend e baixando os módulos necessários.
4. *Verificação do formato do código Terraform:* Garante que o código Terraform esteja formatado corretamente.
5. *Planejamento das mudanças:* Mostra quais recursos o Terraform pretende criar, atualizar ou destruir.
6. *Aplicação das mudanças:* Aplica as mudanças na infraestrutura. Este passo ocorre apenas quando o código é mergeado na branch `main`.

### Destruição da Infraestrutura

A destruição da infraestrutura pode ser iniciada manualmente através do **GitHub Actions**, utilizando o workflow `Terraform Database Destroy`. Este processo irá remover todos os recursos criados pelo Terraform, ajudando a evitar custos inesperados.

## Estrutura do Projeto

- `backend.tf`: Configuração do backend do Terraform para armazenamento do estado e bloqueio.
- `main.tf`: Definição dos recursos da AWS para a instância do banco de dados PostgreSQL.
- `variables.tf`: Variáveis utilizadas na configuração do Terraform.
- `outputs.tf`: Saídas configuradas para fornecer informações úteis após o deploy.
- `.github/workflows/deploy.yml`: Workflow do GitHub Actions para o deploy da infraestrutura.
- `.github/workflows/destroy.yml`: Workflow do GitHub Actions para a destruição da infraestrutura.
