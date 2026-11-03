# Projeto Emerald - API REST & Infraestrutura de Rede

## 1. Identificação dos Integrantes
* Débora Alves

## 2. Descrição dos IPs em cada VM
* **VM 1 (Proxy Reverso - Nginx):** `192.168.56.10`
  * Função: Receber as requisições HTTP do cliente na porta 80 e reencaminhar para a porta 8080 da VM 2.
* **VM 2 (Backend Spring Boot & Banco de Dados MariaDB):** `192.168.56.11`
  * Função: Hospedar a API REST (porta 8080) e o SGBD MariaDB (porta 3306).

## 3. Onde colocar o arquivo do Nginx (VM 1)
O arquivo de configuração do proxy reverso está na pasta `/nginx/api.conf` deste repositório. Para configurá-lo na **VM 1**, abra o terminal como administrador (root), navegue até a pasta onde este repositório foi clonado e execute:

1. Copie o arquivo para a pasta de sites disponíveis do Nginx:
   `cp nginx/api.conf /etc/nginx/sites-available/emerald-api.conf`

2. Crie o link simbólico para ativar o host virtual:
   `ln -s /etc/nginx/sites-available/emerald-api.conf /etc/nginx/sites-enabled/`

3. Remova o padrão do Nginx para evitar conflitos:
   `rm -f /etc/nginx/sites-enabled/default`

4. Teste a sintaxe e reinicie o serviço:
   `nginx -t`
   `systemctl restart nginx`

## 4. Guia de Execução (Como rodar a API na VM 2)
Para inicializar o ambiente de backend na **VM 2**, abra o terminal, navegue até a pasta principal onde este repositório foi clonado e siga os passos abaixo:

1. **Preparar o Banco de Dados:**
   * Certifique-se de que o serviço do MariaDB está ativo: `systemctl start mariadb`
   * Importe a estrutura das tabelas (estando na raiz do repositório):
     `mysql -u emerald_user -p emerald_db < database/schema.sql`

2. **Executar a API REST:**
   * Navegue para dentro da pasta da API:
     `cd api`
   * Inicie a aplicação com o Maven Wrapper:
     `./mvnw spring-boot:run`

3. **Validação do Ambiente:**
   * Com a API rodando na VM 2 e o Nginx ativo na VM 1, acesse pelo navegador do PC físico: `http://192.168.56.10/`

*Nota: A documentação detalhada das rotas da API encontra-se na pasta /docs/API.md.*
