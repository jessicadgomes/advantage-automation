*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://www.advantageonlineshopping.com/accountservice/accountrest/api/v1
${USER_EMAIL}     admin_teste@gmail.com
${USER_PASS}      senhateste123
${USERNAME}       admin_qa

*** Test Cases ***
Criar Usuário ADMIN (público)
    [Documentation]    Tenta criar um usuário com credenciais de admin via API pública
    ${headers}=    Create Dictionary    
    ...    Content-Type=application/json    
    ...    Accept=application/json
    Create Session    advantage    ${BASE_URL}    headers=${headers}    verify=False

    ${body}=    Create Dictionary
    ...    email=${USER_EMAIL}
    ...    loginName=${USERNAME}
    ...    password=${USER_PASS}
    ...    firstName=Admin
    ...    lastName=Teste
    ...    countryId=29

    ${response}=    POST On Session    
    ...    advantage    
    ...    /register    
    ...    json=${body}    
    ...    expected_status=any

    Log    ${response.status_code}
    Log    ${response.text}

    Run Keyword If    '${response.status_code}'=='201'    Log    Usuário criado com s_
