*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${BASE_URL}                    https://www.advantageonlineshopping.com
${ACCOUNT_SERVICE_URL}         ${BASE_URL}/accountservice/accountrest/api/v1
${SEARCH_ENDPOINT}             ${BASE_URL}/catalog/api/v1/products/search
${IMAGE_UPLOAD_ENDPOINT}       ${BASE_URL}/catalog/api/v1/product/image
${ADMIN_USERNAME}              AdminQA
${ADMIN_PASSWORD}              Teste123
${IMAGE_PATH}                  ${CURDIR}/img/imagem.jpg

*** Keywords ***
Autenticar Usuário Admin
    [Documentation]    Faz login e obtém o token de acesso do usuário ADMIN
    Create Session    auth    ${ACCOUNT_SERVICE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    loginName=${ADMIN_USERNAME}    password=${ADMIN_PASSWORD}
    ${response}=    Post Request    auth    /login    headers=${headers}    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable    ${response.json()["token"]}
    [Return]    ${token}

*** Test Cases ***
Usuário busca um produto via API
    [Documentation]    Busca um produto específico e verifica a resposta da API
    Create Session    shop    ${BASE_URL}
    ${response}=    Get Request    shop    /catalog/api/v1/products/search?name=Mice
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_text}=    Convert To String    ${response.text}
    Should Contain    ${response_text}    MICE


