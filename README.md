# 🚀 Projeto DevOps - Fase 1 (Aprendizado Prático)

Olá! Eu sou Adonys Alves 👋  
Este repositório faz parte da minha jornada de aprendizado em DevOps.
Estou estudando na prática conceitos como **Docker, AWS, Deploy de aplicações, Terraform e CI/CD **, seguindo um projeto guiado do YouTube e adaptando com meus próprios testes e aprendizados.

Este repositório contém 3 pastas, cada uma com um projeto independente, mas interligado:
- **projeto-devops-fase-1**: O básico – containerize e deploy manual de um site estático na AWS.
- **projeto-devops-fase-2**: Adicione automação de infraestrutura com Terraform (IaC).
- **projeto-devops-fase-3**: Full automation com CI/CD usando GitHub Actions + Terraform + Docker.
  
<details>
  <summary>📋 Conhecimentos Obrigatórios</summary>

  
**🐧 Linux/Unix Básico**
- Navegação no terminal (ls, cd, mkdir, cp, mv, rm)
- Edição de arquivos (nano, vim ou VS Code)
- Permissões básicas (chmod, sudo)
- SSH e conexões remotas

**☁️ AWS Básico**
- Conceitos de EC2, IAM, VPC, Security Groups
- Como criar instâncias e configurar acesso
- AWS CLI configurado e funcional
- Entender Free Tier e custos básicos

**🐳 Docker Básico-Intermediário**
- Diferença entre imagem e container
- Comandos essenciais (build, run, push, pull)
- Como escrever Dockerfile básico
- Conceito de registries (Docker Hub, ECR)

**🏗️ Terraform Básico**
- Conceitos de Infrastructure as Code (IaC)
- Comandos básicos (init, plan, apply, destroy)
- Entender HCL (HashiCorp Configuration Language)
- Conceito de state file

**🔧 Git/GitHub**
- Comandos básicos (clone, add, commit, push, pull)
- Criação de repositórios
- Conceitos de branches

</details>

<details open>
   <summary>🗂️ Visão Geral dos Projetos</summary>

### Projeto 1: Containerização com Docker e Deploy Manual na AWS (Nível Básico)

- **Problema Real**: Imagine você em uma pequena equipe: O dev altera o código, mas no servidor AWS, "não funciona" por causa de dependências diferentes. Deploys envolvem SSH manual, levando a erros e tempo perdido.
- **Solução Prática**: Use Docker para "empacotar" o site em um container portátil. Crie um ECR na AWS, push a imagem e deploy manual na EC2.
- **Ferramentas Aprendidas**: Docker, AWS CLI, ECR, EC2, Security Groups.
- **Conexão**: Isso resolve o "funciona na minha máquina", mas ainda é manual – preparando o terreno para automação na Fase 2.
- **Tempo Estimado**: 2-3 horas.
- **Desafio Inicial**: Tente deployar manualmente sem Docker e veja os erros de dependências.

<p align="center">
 ☁️ <strong>Diagrama da arquitetura do Projeto 1</strong>
</p>

<p align="center">
  <strong>🟢 Solução</strong>
</p>


<p align="center">
 <img width="932" height="525" alt="image" src="https://github.com/user-attachments/assets/34d5a465-e3d7-402e-8d07-e4df631d9219" />
</p>

### Projeto 2: Automatização de Infraestrutura com Terraform (IaC) (Nível Intermediário)
- **Problema Real**: Agora a startup cresce: Você precisa recriar ambientes (dev/staging/prod) rapidamente, mas cliques manuais no console AWS causam inconsistências, erros e "drift" (mudanças não rastreadas). Um deploy de emergência falha porque uma configuração foi esquecida.
- **Solução Prática**: Trate a infra como código com Terraform. Declare recursos como EC2, ECR e IAM Roles em arquivos HCL, e o Terraform provisiona tudo automaticamente.
- **Ferramentas Aprendidas**: Terraform (init/plan/apply/destroy), backends remotos (S3 para state), outputs para integração.
- **Conexão**: Integra com o Docker do Projeto 1 – agora a infra é reproduzível, mas o deploy ainda requer SSH manual. Isso motiva a full automation na Fase 3.
- **Tempo Estimado**: 2-4 horas.
- **Desafio Inicial**: Tente recriar manualmente o ambiente do Projeto 1 em uma nova região e note os pontos de dor.

<p align="center">
 ☁️ <strong>Diagrama da arquitetura do Projeto 2</strong>
</p>

<p align="center">
  <strong>🟢 Solução</strong>
</p>


<p align="center">
 <img width="934" height="611" alt="image" src="https://github.com/user-attachments/assets/cb1692e0-3f4c-4983-9f8e-d9d656ab2cb7" />
</p>


  ### Projeto 3: Automatização Completa com CI/CD (GitHub Actions + Terraform + Docker) (Nível Avançado)
- **Problema Real**: Com múltiplos devs, changes diárias viram caos: Deploys manuais criam gargalos, erros humanos e falta de auditabilidade. Um pico de tráfego exige update rápido, mas conflitos no Terraform state causam downtime.
- **Solução Prática**: Separe repos (app e infra), use GitHub Actions para pipelines CI/CD. Push no código dispara builds Docker, plans Terraform e deploys com aprovações manuais para segurança.
- **Ferramentas Aprendidas**: GitHub Actions (workflows YAML, secrets, aprovações), integração multi-repo.
- **Conexão**: Une tudo: Docker do Projeto 1 + Terraform do Projeto 2 em um fluxo automatizado. Agora, é um pipeline DevOps real, escalável para equipes.
- **Tempo Estimado**: 3-5 horas.
- **Desafio Inicial**: Simule deploys simultâneos manuais no setup do Projeto 2 e veja conflitos.

</details>

## 🔧 Como Começar
1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/adonysalves/Projeto-Pratico-DevOps-AWS.git
   cd seu-repo-devops
   ```
2. **Escolha uma Fase**: Comece pela pasta `projeto-devops-fase-1` e avance. Cada README tem pré-requisitos, passos e troubleshooting.
3. **Ambiente**: Certifique-se de ter uma conta AWS gratuita (cuidado com custos – use Free Tier). Instale ferramentas como Docker, Terraform e AWS CLI conforme descrito.
4. **Dicas Gerais**:
   - Use VS Code para editar arquivos.
   - Sempre teste localmente antes de apply/destroy.
   - Limpe recursos AWS no final para evitar custos!
5. **Personalize**: Substitua placeholders (ex.: regiões AWS, nomes de repos) com os seus.
---

## 🎓 Conceitos Aprendidos no Geral
- 🐳 **Containerização (Docker)**: Resolve inconsistências de ambiente  
- 🏗️ **IaC (Terraform)**: Automatiza e versiona infraestrutura  
- 🔄 **CI/CD (GitHub Actions)**: Orquestra deploys rápidos e seguros  
- 🔐 **Melhores Práticas**: Secrets management, aprovações, state locking, drift detection  

---
## 📚 Recursos Adicionais
- [Documentação Docker](https://docs.docker.com/)
- [Terraform Learning](https://learn.hashicorp.com/terraform)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- Livros: "The DevOps Handbook" para teoria aplicada.
- Comunidades: Reddit r/devops, Stack Overflow.

---
## 🙌 Créditos e Referências

Este projeto foi desenvolvido com base em um tutorial do YouTube, com fins educacionais, como parte da minha jornada de aprendizado em DevOps.

Durante o processo, segui o passo a passo do conteúdo original e também fiz adaptações para reforçar meu entendimento prático das ferramentas.

Todo o crédito do conteúdo original é da criadora:

👩‍💻 Maria Lazara

🎥 Vídeo no YouTube:  
https://www.youtube.com/watch?v=UEoxMU_l2xs

📁 Repositório original:  
https://github.com/marialazara/laboratorio-devops
