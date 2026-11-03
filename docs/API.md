# Documentação das Rotas da API REST (Emerald)

Esta documentação descreve os endpoints disponíveis para a gestão do sistema Emerald. O IP base para acesso local via Proxy Reverso (VM 1) é `http://192.168.56.10`.

---

## 1. Módulo: Perfis de Acesso
**URL Base:** `/api/v1/perfis`

### Criar novo Perfil (POST)
* **URL:** `/api/v1/perfis`
* **Body (JSON):**
  ```json
  {
    "nomePerfil": "USER"
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Perfis
* **GET** `/api/v1/perfis` - Lista todos os perfis (200 OK)
* **GET** `/api/v1/perfis/{id}` - Busca perfil específico (200 OK)
* **PUT** `/api/v1/perfis/{id}` - Atualiza perfil existente (200 OK)
* **DELETE** `/api/v1/perfis/{id}` - Exclui um perfil (204 No Content)

---

## 2. Módulo: Usuários
**URL Base:** `/api/v1/usuarios`

### Criar novo Usuário (POST)
* **URL:** `/api/v1/usuarios`
* **Body (JSON):**
  ```json
  {
    "nome": "Débora Alves",
    "email": "debora@email.com",
    "senha": "senhaSegura123"
  }
  ```
* **Resposta:** `201 Created`

### Autenticação / Login (POST)
* **URL:** `/api/v1/usuarios/login`
* **Body (JSON):**
  ```json
  {
    "email": "debora@email.com",
    "senha": "senhaSegura123"
  }
  ```
* **Resposta:** `200 OK`

### Outros Endpoints de Usuários
* **GET** `/api/v1/usuarios` - Lista todos os usuários (200 OK)
* **GET** `/api/v1/usuarios/{id}` - Busca usuário específico (200 OK)
* **PUT** `/api/v1/usuarios/{id}` - Atualiza usuário existente (200 OK)
* **DELETE** `/api/v1/usuarios/{id}` - Exclui um usuário (204 No Content)

---

## 3. Módulo: Categorias
**URL Base:** `/api/v1/categorias`

### Criar nova Categoria (POST)
* **URL:** `/api/v1/categorias`
* **Body (JSON):**
  ```json
  {
    "nome": "Alimentação",
    "tipo": "DESPESA",
    "usuarioId": "550e8400-e29b-41d4-a716-446655440000"
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Categorias
* **GET** `/api/v1/categorias` - Lista todas as categorias (200 OK)
* **GET** `/api/v1/categorias/{id}` - Busca categoria específica (200 OK)
* **PUT** `/api/v1/categorias/{id}` - Atualiza categoria existente (200 OK)
* **DELETE** `/api/v1/categorias/{id}` - Exclui uma categoria (204 No Content)

---

## 4. Módulo: Contas Bancárias
**URL Base:** `/api/v1/contas`

### Criar nova Conta Bancária (POST)
* **URL:** `/api/v1/contas`
* **Body (JSON):**
  ```json
  {
    "nomeConta": "Conta Corrente Principal",
    "saldo": 1500.00,
    "tipoConta": "CORRENTE",
    "usuarioId": "550e8400-e29b-41d4-a716-446655440000"
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Contas
* **GET** `/api/v1/contas` - Lista todas as contas (200 OK)
* **GET** `/api/v1/contas/{id}` - Busca conta específica (200 OK)
* **PUT** `/api/v1/contas/{id}` - Atualiza conta existente (200 OK)
* **DELETE** `/api/v1/contas/{id}` - Exclui uma conta (204 No Content)

---

## 5. Módulo: Metas Financeiras
**URL Base:** `/api/v1/metas`

### Criar nova Meta Financeira (POST)
* **URL:** `/api/v1/metas`
* **Body (JSON):**
  ```json
  {
    "valorLimite": 450.00,
    "mesAno": "07/2026",
    "usuarioId": "550e8400-e29b-41d4-a716-446655440000",
    "categoriaId": "123e4567-e89b-12d3-a456-426614174000"
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Metas
* **GET** `/api/v1/metas` - Lista todas as metas (200 OK)
* **GET** `/api/v1/metas/{id}` - Busca meta específica (200 OK)
* **PUT** `/api/v1/metas/{id}` - Atualiza meta existente (200 OK)
* **DELETE** `/api/v1/metas/{id}` - Exclui uma meta (204 No Content)

---

## 6. Módulo: Métodos de Pagamento
**URL Base:** `/api/v1/metodos-pagamento`

### Criar novo Método de Pagamento (POST)
* **URL:** `/api/v1/metodos-pagamento`
* **Body (JSON):**
  ```json
  {
    "nomeMetodo": "Pix"
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Métodos de Pagamento
* **GET** `/api/v1/metodos-pagamento` - Lista todos os métodos (200 OK)
* **GET** `/api/v1/metodos-pagamento/{id}` - Busca método específico (200 OK)
* **PUT** `/api/v1/metodos-pagamento/{id}` - Atualiza método existente (200 OK)
* **DELETE** `/api/v1/metodos-pagamento/{id}` - Exclui um método (204 No Content)

---

## 7. Módulo: Transações
**URL Base:** `/api/v1/transacoes`

### Criar nova Transação (POST)
* **URL:** `/api/v1/transacoes`
* **Body (JSON):**
  ```json
  {
    "descricao": "Compra mensal no supermercado",
    "valor": -250.50,
    "data": "2026-11-03T10:00:00Z",
    "contaBancariaId": "550e8400-e29b-41d4-a716-446655440000",
    "categoriaId": "123e4567-e89b-12d3-a456-426614174000",
    "metodoPagamentoId": 1
  }
  ```
* **Resposta:** `201 Created`

### Outros Endpoints de Transações
* **GET** `/api/v1/transacoes` - Lista todas as transações (200 OK)
* **GET** `/api/v1/transacoes/{id}` - Busca transação específica (200 OK)
* **PUT** `/api/v1/transacoes/{id}` - Atualiza transação existente (200 OK)
* **DELETE** `/api/v1/transacoes/{id}` - Exclui uma transação (204 No Content)