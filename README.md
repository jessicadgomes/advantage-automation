🧪 Projeto de Automação de Testes - Advantage Online Shopping
Este projeto tem como objetivo a automação de testes funcionais Web e API do site Advantage Online Shopping, utilizando o Robot Framework com suporte a bibliotecas como SeleniumLibrary e RequestsLibrary.

🚀 Tecnologias Utilizadas
Robot Framework: Framework de automação de testes.

SeleniumLibrary: Para automação de testes Web.

RequestsLibrary: Para automação de testes de API.

Python 3.x

ChromeDriver: Necessário para os testes em navegador.

│   advantage_testes.robot.robot           # Casos de teste principais
├── Resources/
│   └── keywords.robot                 # Arquivo com os Keywords utilizados
├── README.md                          # Este arquivo
```
>>>>>>> 7d2acbc39429c83c30ebc0db9ec842e3973cd8d3

📁 Estrutura do Projeto
bash
Copiar
Editar
ADVANTAGE-AUTOMATION/
├── img/                        # Imagens usadas nos testes (ex: upload)
│   └── imagem.jpg
├── Resources/                 # Recursos e keywords reutilizáveis
│   ├── keywords.robot
│   └── login_admin.robot
├── resultado/                 # Relatórios gerados após execução
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── resultados/               # Capturas de tela dos testes Web
│   ├── busca_produto.png
│   ├── produto_adicionado.png
│   └── ...
├── tests/                     # Casos de teste
│   ├── api/                   # Testes de API
│   │   ├── test_busca.robot
│   │   ├── test_criar_user_admin.robot
│   │   └── test_upload.robot
│   ├── web/                   # Testes Web (UI)
│   │   └── test_compra_produto.robot
│   └── variables/             # Variáveis globais do projeto
│       ├── variables.robot
│       └── variables.yaml
└── README.md

✅ Testes Implementados
🔎 Web
Buscar Produto

Valida a busca por um produto na home.

Adicionar Produto ao Carrinho

Verifica se o produto aparece corretamente no carrinho.

Validar Produto na Tela de Pagamento

Garante que o item listado na tela de pagamento seja o esperado.

🌐 API
Criar Usuário Admin

Realiza a criação de um usuário com permissão ADMIN.

Buscar Produto via API

Testa a busca de um item diretamente pelo endpoint da API.

Upload de Imagem com Usuário Admin

Realiza login e faz o upload de uma imagem para o produto, exigindo autenticação com token.

📦 Instalação e Execução
Pré-requisitos
Python 3.x

Pip

Chrome + ChromeDriver

Instalação
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests

Coloque o chromedriver no mesmo diretório do projeto ou adicione ao PATH do sistema.

Executar Testes
Executar todos os testes Web:
robot tests/web

Executar um teste específico:
robot tests/api/test_upload.robot

📊 Relatórios
Após a execução, os seguintes arquivos são gerados automaticamente na pasta resultado/:

log.html: Log detalhado da execução

report.html: Relatório resumido

output.xml: Saída padrão em XML

📸 Evidências de Execução
As imagens geradas durante os testes Web ficam salvas na pasta resultados/.

🤝 Contribuições
Sinta-se à vontade para contribuir:

Fork este repositório.

Crie uma branch com sua feature: git checkout -b minha-feature

Commit suas alterações: git commit -m 'feat: nova feature'

Push para a branch: git push origin minha-feature

Abra um Pull Request

📌 Observações
O ambiente deve estar configurado com as variáveis corretas para autenticação (usuário admin).

Certifique-se de atualizar os endpoints conforme alterações na API do Advantage Shopping.

Desenvolvido com 💻 por **Jéssica Gomes**
