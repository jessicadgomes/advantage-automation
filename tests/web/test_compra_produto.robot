*** Settings ***

Resource    ../resources/keywordsConsulta.robot
Suite Setup    Abrir o navegador
Suite Teardown    Fechar o navegador

*** Test Cases ***
Buscar um produto
    Dado que estou na home page do Advantage Online Shopping
    Buscar por "Bose Soundlink Bluetooth Speaker III"
    Então deve ser exibido o produto "Bose Soundlink Bluetooth Speaker III"

Incluir produto no carrinho
    Dado que estou na home page do Advantage Online Shopping
    Buscar por "Bose Soundlink Bluetooth Speaker III"
    Quando adicionar o primeiro produto ao carrinho
    Então o produto deve aparecer no carrinho

Validar produto na tela de pagamento
    Dado que o produto está no carrinho
    Quando acessar a tela de pagamento
    Então o produto deve estar listado na tela de pagamento
