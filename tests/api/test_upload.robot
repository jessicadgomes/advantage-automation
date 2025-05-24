*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}           https://www.advantageonlineshopping.com
${LOGIN_ENDPOINT}     /accountservice/accountrest/api/v1/login
${UPLOAD_ENDPOINT}    /catalog/api/v1/product/image/AdminQA/source/color
${USERNAME}           AdminQA
${PASSWORD}           Teste123
${IMAGE_PATH}         img/imagem.jpg

*** Test Cases ***
Upload de Imagem de Produto com Usuário Admin
    [Documentation]    Realiza login como Admin e envia uma imagem para um produto via API

    # Login para obter token
    Create Session    auth    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    loginName=${USERNAME}    password=${PASSWORD}
    ${response}=    Post Request    auth    ${LOGIN_ENDPOINT}    headers=${headers}    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable    ${response.json()["token"]}
    Log    Token: ${token}

    # Confirma se imagem existe
    File Should Exist    ${IMAGE_PATH}

    # Upload
    Create Session    shop    ${BASE_URL}
    ${upload_headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${files}=    Create Dictionary    file=@${IMAGE_PATH}    image=@${IMAGE_PATH}
    ${upload_response}=    Post Request    shop    ${UPLOAD_ENDPOINT}    headers=${upload_headers}    files=${files}

    # Logs e validações
    Log    ${upload_response.status_code}
    Log    ${upload_response.text}
    Should Be Equal As Strings    ${upload_response.status_code}    200
    Dictionary Should Contain Key    ${upload_response.json(_
