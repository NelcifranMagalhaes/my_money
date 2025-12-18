# My Money 💰

Aplicação Rails para gerenciamento de finanças pessoais, permitindo controle de receitas e despesas por categoria.

## 📋 Sobre o Projeto

My Money é uma aplicação web desenvolvida em Ruby on Rails para ajudar no controle financeiro pessoal. Com ela você pode:

- Registrar entradas de dinheiro (Money In)
- Registrar saídas de dinheiro (Money Out)
- Organizar transações por categorias
- Visualizar e gerenciar suas finanças

## 🛠️ Tecnologias

- **Ruby** 3.x
- **Rails** 8.1.1
- **PostgreSQL** (banco de dados)
- **Bootstrap** 5.3.5 (interface)
- **Hotwire** (Turbo & Stimulus)
- **Importmap** (gerenciamento de JavaScript)
- **DartSass** (compilação de CSS)

## 📦 Pré-requisitos

- Ruby 3.x
- PostgreSQL
- Node.js (para gerenciamento de assets)
- Bundler

## 🚀 Instalação

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd my_money
```

2. Instale as dependências:
```bash
bundle install
```

3. Configure o banco de dados:
```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

4. Inicie o servidor de desenvolvimento:
```bash
bin/dev
```

O servidor estará disponível em `http://localhost:3000`

## 🎯 Funcionalidades

### Categorias
Gerencie categorias para organizar suas transações financeiras.

### Money In (Receitas)
Registre todas as suas fontes de renda e receitas.

### Money Out (Despesas)
Controle suas despesas e gastos diários.

## 🧪 Testes

Execute os testes com:
```bash
bin/rails test
bin/rails test:system
```

## 📝 Estrutura do Projeto

```
app/
├── controllers/      # Controladores da aplicação
├── models/          # Modelos de dados
├── views/           # Templates ERB
├── javascript/      # Código JavaScript/Stimulus
└── assets/          # Assets (CSS, imagens)

config/              # Configurações
db/                  # Migrações e schema do banco
test/                # Testes automatizados
```

## 🔧 Comandos Úteis

- `bin/dev` - Inicia servidor e watchers (CSS)
- `bin/rails console` - Console interativo
- `bin/rails routes` - Lista todas as rotas
- `bin/rails db:migrate` - Executa migrações pendentes
- `bin/rails test` - Executa suite de testes

## 📄 Licença

Este projeto é de código aberto.
