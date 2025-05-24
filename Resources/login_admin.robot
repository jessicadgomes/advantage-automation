*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://www.advantageonlineshopping.com/accountservice/accountrest/api/v1
${ADMIN_EMAIL}    admin_teste@gmail.com
${ADMIN_PASS}     senhateste123

*** Keywords ***
Login As Admin
    [Documentation]    Faz login e retorna a resposta da API
    Create Session    advantage    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json
    ${body}=    Create Dictionary    loginName=${ADMIN_EMAIL}    password=${ADMIN_PASS}
    ${response}=    POST On Session    advantage    /login    headers=${headers}    json=${body}    expected_status=200
    Should Be Equal As Strings    ${response.status_code}    200
    [Return]    ${response.json()["token"]}

*** Test Cases ***
Login Admin
    [Documentation]    Testa a autenticação do usuário admin
    ${token}=    Login As Admin
    Log    Token recebido: ${token}
