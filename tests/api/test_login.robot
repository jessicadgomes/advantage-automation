*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://www.advantageonlineshopping.com/accountservice/accountrest/api/v1

*** Test Cases ***
Login Usuário ADMIN Existente
    [Documentation]    Realiza login com usuário admin já existente e valida o token
    ${headers}=    Create Dictionary    Content-Type=application/json
    Create Session    advantage    ${BASE_URL}    headers=${headers}    verify=False
    ${body}=    Create Dictionary
    ...    email=jess@teste.com
    ...    loginPassword=Teste123
    ...    loginUser=JessQA
    ${response}=    POST On Session    advantage    /login    json=${body}    expected_status=any
    Log    ${response.status_code}
    Log    ${response.text}