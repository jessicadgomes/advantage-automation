# Testes Automatizados - Advantage Online Shopping 🛒

Este repositório contém testes automatizados utilizando **Robot Framework** e **SeleniumLibrary** para o site [Advantage Online Shopping](https://advantageonlineshopping.com/#/). O objetivo é validar funcionalidades essenciais de navegação, busca e fluxo de compra no e-commerce.

## 🧪 Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- Python 3.x
- Google Chrome + ChromeDriver

## 📋 Estrutura dos Arquivos

```

│   advantage_testes.robot.robot           # Casos de teste principais
├── Resources/
│   └── keywords.robot                 # Arquivo com os Keywords utilizados
├── README.md                          # Este arquivo
```

## 📌 Pré-requisitos

- Python 3 instalado
- Google Chrome instalado
- ChromeDriver compatível com a versão do navegador
- Instalar dependências:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

## 🚀 Como Executar os Testes

Execute o seguinte comando na raiz do projeto:

```bash
 robot -d resultados advantage_testes.robot    
```

## ✅ Casos de Teste

| Caso de Teste                         | Descrição                                                                 |
|--------------------------------------|---------------------------------------------------------------------------|
| Buscar um produto                    | Valida a busca pelo produto "Bose Soundlink Bluetooth Speaker III"       |
| Incluir produto no carrinho          | Valida a adição do produto ao carrinho                                   |
| Validar produto na tela de pagamento | Verifica se o produto adicionado aparece corretamente na tela de checkout|

## 📝 Observações

- Todos os testes utilizam o navegador **Chrome**.
- Há captura de tela ao final de cada execução para facilitar a análise em caso de falha.
- Elementos foram identificados utilizando **XPath**.

## 📷 Evidências

As capturas de tela dos testes são salvas automaticamente para análise posterior.

---

Desenvolvido com 💻 por **Jéssica Gomes**
