# 🏋️‍♂️ Workout API - Desafio DIO/Santander Back-End com Python

Este projeto foi desenvolvido como parte do programa **Santander Bootcamp 2024 - Back-End com Python** da [Digital Innovation One](https://www.dio.me/), atendendo aos requisitos do desafio proposto.

## 📌 Objetivo do Desafio
Implementar melhorias na API fornecida pelo instrutor, aplicando os seguintes requisitos:

- **Adicionar Query Parameters** nos endpoints:
  - `GET /atletas/?nome=...`
  - `GET /atletas/?cpf=...`
- **Customizar a resposta** do endpoint `GET /atletas/` para retornar apenas:
  - `nome`
  - `centro_treinamento`
  - `categoria`
- **Manipular exceção de integridade de dados** (`IntegrityError`) com mensagem personalizada:
  ```
  Já existe um atleta cadastrado com o cpf: <cpf>
  ```
  - Status Code: **303**
- **Adicionar paginação** utilizando a lib [fastapi-pagination](https://pypi.org/project/fastapi-pagination/) com parâmetros:
  - `limit`
  - `offset`

---

## 🚀 Como Rodar o Projeto

### 1️⃣ Clonar o repositório
```bash
git clone https://github.com/IgorBrito02/workout_api.git
cd workout_api
```

### 2️⃣ Criar e ativar o ambiente virtual
```bash
python -m venv .venv
.venv\Scripts\activate   # Windows
source .venv/bin/activate # Linux/Mac
```

### 3️⃣ Instalar dependências
```bash
pip install -r requirements.txt
```

### 4️⃣ Subir os containers com Docker
```bash
docker-compose up --build
```

### 5️⃣ Rodar migrações
```bash
docker-compose run --rm api alembic upgrade head
```

### 6️⃣ Acessar a documentação da API
[http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

---

## 🧪 JSONs para Testes no `/docs`

### Criar Categorias
```json
{
  "nome": "Scale"
}
```
```json
{
  "nome": "Rx"
}
```

### Criar Centros de Treinamento
```json
{
  "nome": "CT King",
  "endereco": "Rua X, Q02",
  "proprietario": "Marcos"
}
```
```json
{
  "nome": "CT Power",
  "endereco": "Avenida Y, Q10",
  "proprietario": "Paulo"
}
```

### Criar Atletas
```json
{
  "nome": "João",
  "cpf": "12345678900",
  "idade": 25,
  "peso": 75.5,
  "altura": 1.70,
  "sexo": "M",
  "categoria": { "nome": "Scale" },
  "centro_treinamento": { "nome": "CT King" }
}
```
```json
{
  "nome": "Maria",
  "cpf": "98765432100",
  "idade": 28,
  "peso": 62.0,
  "altura": 1.65,
  "sexo": "F",
  "categoria": { "nome": "Rx" },
  "centro_treinamento": { "nome": "CT Power" }
}
```
```json
{
  "nome": "José",
  "cpf": "11122233344",
  "idade": 30,
  "peso": 80.0,
  "altura": 1.75,
  "sexo": "M",
  "categoria": { "nome": "Scale" },
  "centro_treinamento": { "nome": "CT Power" }
}
```

---

## 🔍 Testes de Funcionalidades

- **Query Parameters**
  - `GET /atletas/?nome=Jo` → Retorna atletas com "Jo" no nome
  - `GET /atletas/?cpf=12345678900` → Retorna apenas João

- **Resposta Customizada**
  - `GET /atletas/` retorna apenas `nome`, `centro_treinamento`, `categoria`

- **Tratamento de Duplicidade**
  - Criar atleta com CPF já existente → Status **303** e mensagem personalizada

- **Paginação**
  - `GET /atletas/?limit=1&offset=0` → Primeiro atleta
  - `GET /atletas/?limit=1&offset=1` → Segundo atleta

---

## 🛠 Tecnologias Utilizadas
- Python 3.12
- FastAPI
- SQLAlchemy
- Alembic
- PostgreSQL
- Docker / Docker Compose
- fastapi-pagination

---

## 📄 Licença
Este projeto está sob a licença MIT.