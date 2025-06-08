# 🧪 Projeto de Automação de Testes – Advantage Online Shopping

Este repositório contém um projeto de **automação de testes funcionais Web e API** para o site [Advantage Online Shopping](https://www.advantageonlineshopping.com), utilizando **Robot Framework**, com bibliotecas complementares e recursos em **Python**.

---

## 🚀 Tecnologias Utilizadas

- **Robot Framework** – Framework principal de automação.
- **SeleniumLibrary** – Automação da interface Web.
- **RequestsLibrary** – Testes de API RESTful.
- **Python 3.x**
- **ChromeDriver** – Necessário para testes Web com navegador Chrome.

---

## 📁 Estrutura do Projeto
advantage-automation/
├── .env # Variáveis de ambiente (não versionado)
├── .gitignore # Arquivos e pastas ignoradas pelo Git
├── image/ # Imagens usadas para upload via API
│ └── headphone.jpg
├── resultados/ # Evidências visuais dos testes Web
│ └── busca_produto.png
├── tests/
│ ├── api/ # Testes de API
│ │ ├── test_busca_produto/
│ │ ├── test_login/
│ │ └── test_upload_imagem/
│ ├── web/ # Testes Web
│ │ └── test_compra_produto/
│ └── resources/ # Recursos reutilizáveis
│ ├── keywordsConsulta/
│ └── load_env/
└── README.md

---

## ✅ Testes Implementados

### 🌐 API

- **🔍 Buscar Produto**
  - Valida a resposta do endpoint ao buscar produto por nome.

- **🔑 Login**
  - Realiza autenticação e valida retorno do token JWT.

- **📤 Upload de Imagem (Produto)**
  - Autentica com usuário **admin** e realiza o upload de uma imagem `.jpg`.
  - Valida o retorno **HTTP 200 OK**.

> **🔒 Autenticação:** via token JWT (formato Bearer)  
> **📎 Formato:** `multipart/form-data`  
> **🖼️ Imagem:** obrigatoriamente `.jpg`

💡 **Exemplo de envio da imagem no Robot Framework:**
```robot
${file_content}=    Evaluate    open(r"""${IMAGE_PATH}""", "rb").read()
${file_tuple}=      Create List    headphone.jpg    ${file_content}    image/jpeg
&{files}=           Create Dictionary    file=${file_tuple}

🖥 Web
🔍 Buscar Produto

Valida a busca na página inicial.

🛒 Adicionar ao Carrinho

Verifica se o produto aparece corretamente no carrinho.

💳 Tela de Pagamento

Confirma os dados no checkout.

📦 Instalação e Execução
🔧 Pré-requisitos
Python 3.x

pip (gerenciador de pacotes)

Google Chrome + ChromeDriver compatível

⚙️ Instalação de Dependências
pip install robotframework
pip install robotframework-requests
pip install robotframework-seleniumlibrary
 Coloque o chromedriver no diretório do projeto ou adicione-o ao PATH do sistema.

▶️ Como Executar os Testes
Executar todos os testes Web:
robot tests/web
Executar teste específico de upload de imagem via API:
robot tests/api/test_upload_imagem

📊 Relatórios e Evidências
Após a execução, os seguintes arquivos serão gerados automaticamente:

log.html – Log detalhado da execução

report.html – Relatório resumido

output.xml – Saída padrão do Robot Framework

📸 Imagens dos testes Web são salvas na pasta resultados/

📌 Observações
O teste de upload exige um token JWT válido de um usuário admin.

A imagem precisa estar no formato .jpg e no caminho definido pela variável ${IMAGE_PATH}.

Verifique a documentação da API para endpoints atualizados.

🚫 Segurança e Boas Práticas
Os arquivos .env (com variáveis sensíveis como credenciais) e resultados/ estão listados no .gitignore e não são versionados pelo Git, garantindo segurança e organização do repositório.

🤝 Contribuições
Contribuições são bem-vindas! Para colaborar:

Faça um fork do repositório

Crie uma branch: git checkout -b minha-feature

Faça commits: git commit -m "feat: nova feature"

Envie a branch: git push origin minha-feature

Abra um Pull Request explicando sua proposta

👩‍💻 Desenvolvido por
Jéssica Gomes