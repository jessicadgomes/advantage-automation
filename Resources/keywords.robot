*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}                    https://advantageonlineshopping.com/#/
${CAMPO_PRODUTO}          //span[@id='speakersTxt']
${PRODUTO_LINK}           //a[normalize-space()='Bose Soundlink Bluetooth Speaker III']
${BOTAO_ADICIONAR}        //button[normalize-space()='ADD TO CART']
${CARRINHO_ICON}          //a[@id='shoppingCartLink']//*[name()='svg']
${BOTAO_CHECKOUT}         //button[@id='checkOutPopUp']
${VALIDA_PAGAMENTO}       //h3[normalize-space()='ORDER PAYMENT']

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que estou na home page do Advantage Online Shopping
    Go To    ${URL}
    Wait Until Element Is Visible    ${CAMPO_PRODUTO}    timeout=15s
    Capture Page Screenshot    home_page.png

Buscar por "Bose Soundlink Bluetooth Speaker III"
    Click Element    ${CAMPO_PRODUTO}
    Wait Until Element Is Visible    ${PRODUTO_LINK}    timeout=20s
    Capture Page Screenshot    busca_produto.png

Então deve ser exibido o produto "Bose Soundlink Bluetooth Speaker III"
    Element Should Be Visible    ${PRODUTO_LINK}
    Capture Page Screenshot    produto_exibido.png

Quando adicionar o primeiro produto ao carrinho
    Click Element    ${PRODUTO_LINK}
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR}    timeout=10s
    Click Button    ${BOTAO_ADICIONAR}
    Capture Page Screenshot    produto_adicionado.png

Então o produto deve aparecer no carrinho
    Click Element    ${CARRINHO_ICON}
    Wait Until Element Is Visible    ${BOTAO_CHECKOUT}    timeout=10s
    Capture Page Screenshot    produto_no_carrinho.png

Quando acessar a tela de pagamento
    Click Element    ${CARRINHO_ICON}
    Wait Until Element Is Visible    ${BOTAO_CHECKOUT}    timeout=10s
    Click Element    ${BOTAO_CHECKOUT}
    Capture Page Screenshot    tela_pagamento.png

Então o produto deve estar listado na tela de pagamento
    Wait Until Element Is Visible    ${VALIDA_PAGAMENTO}     timeout=10s
    Capture Page Screenshot    produto_listado_pagamento.png


Dado que o produto está no carrinho
    [Documentation]    Garante que o produto está no carrinho antes de prosseguir
    Dado que estou na home page do Advantage Online Shopping
    Buscar por "Bose Soundlink Bluetooth Speaker III"
    Quando adicionar o primeiro produto ao carrinho
    Então o produto deve aparecer no carrinho