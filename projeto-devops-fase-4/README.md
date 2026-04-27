# 🚀 Projeto DevOps com CI/CD e Infraestrutura como Código

Este projeto demonstra a implementação completa de um fluxo DevOps utilizando **CI/CD**, **Docker** e **Infraestrutura como Código (IaC)** na AWS.

---

## 📁 Estrutura do Projeto

Uma das principais características deste projeto é a separação em **dois repositórios**:

### 🔹 Repositório da Aplicação
- Código da aplicação  
- Dockerfile  
- Pipeline de deploy (CI/CD)  

### 🔹 Repositório de Infraestrutura
- Arquivos `.tf` (Terraform)  
- Pipeline de provisionamento da infraestrutura  

Essa abordagem melhora a organização, escalabilidade e manutenção do projeto.

---

## 🔄 Pipeline da Aplicação (CI/CD)

O pipeline de deploy é definido no arquivo `deploy.yaml` e é executado automaticamente a cada push na branch `main`.

### Etapas:

#### 1. Build e Push da Imagem
- Constrói a imagem Docker  
- Gera uma tag baseada no SHA do commit  
- Envia a imagem para o Amazon ECR  

#### 2. Deploy na EC2
- Executado após o sucesso do build (`needs`)  
- Conecta na instância via SSH  
- Para o container antigo  
- Sobe o novo container com a versão atualizada  

---

## ⚙️ Pipeline de Infraestrutura (Terraform)

O pipeline definido em `terraform.yaml` é executado manualmente via **workflow_dispatch** no GitHub.

### Funcionalidades:

- Permite escolher ações como:
  - `plan`
  - `apply`
  - `destroy`
  - `plan_destroy`

### Segurança:

- O `terraform plan` sempre é executado  
- `apply` e `destroy` só rodam com confirmação explícita via input  
- Autenticação com a AWS usando **OIDC** (sem necessidade de armazenar chaves de acesso)  

---

## ☁️ Infraestrutura na AWS

Provisionada com Terraform, inclui:

- VPC  
- Subnet pública  
- Internet Gateway  
- Security Group  
- Key Pair  
- Instância EC2  
- Repositório no Amazon ECR  

### 🐳 Configuração da EC2

A instância EC2 é inicializada com um script `user_data.sh` que:

- Instala o Docker automaticamente  
- Deixa o ambiente pronto para execução de containers  
- Permite acesso ao ECR via IAM Role (sem uso de senha)  

---

## 🔥 Diferencial do Projeto (Etapa 4)

Em comparação com a etapa anterior, este projeto evolui com:

- Separação entre aplicação e infraestrutura  
- Pipeline completo de CI/CD  
- Provisionamento automatizado com Terraform  
- Uso de `user_data.sh` para inicialização automática da EC2  
- Integração com ECR e execução de containers em produção  

---

## 🎯 Resultado Final

Este projeto entrega um fluxo totalmente automatizado:

> Do provisionamento da infraestrutura → até o deploy da aplicação em container rodando na AWS 🚀