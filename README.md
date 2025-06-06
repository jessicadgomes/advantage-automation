# 🧪 Projeto de Automação de Testes – Advantage Online Shopping

Este projeto automatiza testes funcionais **Web e API** no site [Advantage Online Shopping](https://www.advantageonlineshopping.com), utilizando o **Robot Framework** com suporte às bibliotecas **SeleniumLibrary**, **RequestsLibrary** e recursos em **Python**.

---

## 🚀 Tecnologias Utilizadas

- **Robot Framework**: Framework principal de automação.
- **RequestsLibrary**: Para testes de API RESTful.
- **SeleniumLibrary**: Para testes funcionais na interface Web.
- **Python 3.x**
- **ChromeDriver**: Necessário para execução dos testes Web com navegador.

---

## 📁 Estrutura do Projeto

advantage-automation/
├── image/ # Imagens usadas para upload via API
│ └── headphone.jpg
├── Resources/ # Keywords reutilizáveis
│ ├── keywords.robot
├── resultados/ # Evidências visuais dos testes Web
│ ├── busca_produto.png
│ └── ...
├── tests/
│ ├── api/ # Casos de teste para API
│ │ ├── test_busca_produto.robot
│ │ ├── test_login.robot
│ │ └── test_upload.robot
│ ├── web/ # Casos de teste para Web (UI)
│ │ └── test_compra_produto.robot
│ └── variables/
│ ├── variables.robot # Variáveis compartilhadas
│ └── variables.yaml
└── README.md
---

## ✅ Testes Implementados

### 🌐 API

#### 🔍 Buscar Produto
- Valida a resposta do endpoint de busca de produto por nome.

#### 📤 Upload de Imagem (Produto)
- Realiza login com usuário **admin** e faz upload de uma imagem `.jpg` para um produto.
- Verifica o **status HTTP 200 OK** como resposta de sucesso.

📌 **Detalhes técnicos do upload:**
- Autenticação via **token JWT** (formato Bearer).
- Upload via `multipart/form-data`.
- A imagem deve obrigatoriamente estar no formato `.jpg`.

💡 **Exemplo de envio da imagem:**

```robot
${file_content}=    Evaluate    open(r"""${IMAGE_PATH}""", "rb").read()
${file_tuple}=      Create List    headphone.jpg    ${file_content}    image/jpeg
&{files}=           Create Dictionary    file=${file_tuple}

🖥 Web
Buscar Produto: Valida a busca de um produto na página inicial.

Adicionar ao Carrinho: Garante que o produto aparece corretamente no carrinho.

Tela de Pagamento: Verifica se os dados do produto estão corretos no checkout.

📦 Instalação e Execução
🔧 Pré-requisitos
Python 3.x

pip (gerenciador de pacotes)

Google Chrome + ChromeDriver compatível com a versão instalada

⚙️ Instalação
pip install robotframework
pip install robotframework-requests
pip install robotframework-seleniumlibrary
💡 Coloque o chromedriver no mesmo diretório do projeto ou adicione ao PATH do sistema.

▶️ Executando os Testes
Todos os testes Web:
robot tests/web

Teste específico de upload de imagem via API:
robot tests/api/test_upload.robot
📊 Relatórios e Evidências
Após a execução dos testes, serão gerados automaticamente:

log.html: Log detalhado da execução

report.html: Relatório resumido

output.xml: Saída padrão do Robot Framework

📸 Imagens de testes Web são salvas na pasta resultados/.

📌 Observações
O teste de upload exige token válido de autenticação JWT de um usuário admin.

O arquivo enviado precisa estar no formato .jpg e no caminho correto definido pela variável.

Os endpoints e tokens podem mudar. Verifique a documentação da API antes de executar os testes.

🤝 Contribuições
Contribuições são muito bem-vindas! Siga os passos:

Faça um fork do repositório.

Crie uma nova branch:
git checkout -b minha-feature

Commit suas alterações:
git commit -m "feat: nova feature"

Suba para seu repositório:
git push origin minha-feature
Abra um Pull Request explicando sua proposta.

👩‍💻 Desenvolvido por
Jéssica Gomes