# Projeto Oficina

## Descrição

Este projeto implementa o esquema de banco de dados para uma oficina, incluindo as tabelas para clientes, veículos, serviços, ordens de serviço e itens de ordem de serviço. O banco de dados foi modelado para gerenciar informações sobre clientes, seus veículos, serviços oferecidos e ordens de serviço realizadas.

## Estrutura do Banco de Dados

- **Cliente**: Contém informações sobre os clientes.
- **Veículo**: Armazena dados dos veículos dos clientes.
- **Serviço**: Lista os serviços oferecidos pela oficina.
- **Ordem de Serviço**: Registra as ordens de serviço realizadas.
- **Itens de Ordem de Serviço**: Detalha os serviços incluídos em cada ordem.

## Consultas SQL

1. **Recuperar todos os clientes**
   ```sql
   SELECT * FROM Cliente;
