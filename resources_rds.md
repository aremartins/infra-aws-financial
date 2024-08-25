# Documentação do Projeto: Provisionamento de Infraestrutura AWS com Terraform

## **Visão Geral**

Este documento descreve as etapas seguidas para provisionar uma infraestrutura na AWS utilizando Terraform. A infraestrutura criada inclui uma instância RDS MySQL, junto com a configuração básica de rede (VPC, Subnets, Security Groups) necessária para suportar a operação do banco de dados.

## **Etapas Realizadas**

### 1. **Configuração do Terraform**

Inicialmente, o Terraform foi configurado para provisionar os recursos na AWS. Isso incluiu a criação dos arquivos `main.tf`, `variables.tf`, e `terraform.tfvars`, onde as variáveis necessárias foram definidas.

### 2. **Criação da Infraestrutura de Rede**

- **VPC**: Uma VPC foi criada com o bloco CIDR `10.0.0.0/16`.
- **Subnets**: Duas subnets foram criadas em diferentes zonas de disponibilidade (`us-east-1a` e `us-east-1b`) com os blocos CIDR `10.0.3.0/24` e `10.0.4.0/24`, respectivamente.
- **Internet Gateway**: Um Internet Gateway foi provisionado e associado à VPC.
- **Route Tables**: Uma tabela de rotas foi criada e associada às subnets para permitir o tráfego de saída para a internet.

### 3. **Criação do Security Group**

Um Security Group foi configurado para permitir o acesso à instância RDS MySQL na porta 3306, permitindo o tráfego de qualquer origem (por enquanto, o acesso é aberto, mas recomenda-se restringir isso a endereços IP específicos).

### 4. **Criação da Instância RDS MySQL**

Uma instância RDS MySQL foi criada com as seguintes características:

- **Tipo de Instância**: `db.t3.micro`
- **Engine**: MySQL Community Edition, versão 8.0
- **Alocação de Armazenamento**: 20 GB
- **Nome do Banco de Dados**: `irocdb`
- **Usuário Administrador**: `admin`

### 5. **Execução do Terraform**

O comando `terraform apply` foi executado para provisionar a infraestrutura. Após a confirmação, o Terraform criou os recursos na AWS, conforme especificado nos arquivos de configuração.

### 6. **Verificação da Criação dos Recursos**

A criação dos recursos foi verificada tanto no console AWS quanto no terminal do VS Code. As imagens abaixo mostram a confirmação do sucesso.


### **1. Instância RDS Criada no Console AWS**

![RDS Instance Created](https://github.com/aremartins/infra-aws-financial/blob/feature/infra/imgs/rds-criado.png?raw=true)

A instância RDS MySQL é exibida como "Available" no console do AWS RDS.

### **2. Saída do Terraform no VS Code**

![Terraform Apply Complete](https://github.com/aremartins/infra-aws-financial/blob/feature/infra/imgs/sucesso-rds.png?raw=true)

O terminal do VS Code mostra que o Terraform concluiu a criação da instância RDS com sucesso.

