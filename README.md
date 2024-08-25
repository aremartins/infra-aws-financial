# Projeto de Infraestrutura AWS com Terraform

Este repositório contém a infraestrutura AWS configurada utilizando Terraform para o projeto IROC. O objetivo é provisionar e gerenciar recursos como VPC, subnets, security groups, e instâncias RDS MySQL, entre outros.

## Índice

- [Visão Geral](#visão-geral)
- [Configuração Inicial](#configuração-inicial)
- [Documentação da Instância RDS](https://github.com/aremartins/infra-aws-financial/blob/feature/infra/resources_rds.md)

## Visão Geral

Este projeto utiliza Terraform para provisionar a infraestrutura necessária para rodar uma aplicação financeira na AWS. Ele inclui a configuração de VPCs, subnets, security groups, e uma instância RDS MySQL.

## Configuração Inicial

### Requisitos

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configurado com as credenciais apropriadas
- Conta AWS com permissões para criar recursos

### Instruções

1. Clone o repositório:
   ```bash
   git clone https://github.com/aremartins/infra-aws-financial.git
   cd infra-aws-financial
