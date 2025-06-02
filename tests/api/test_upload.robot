*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${BASE_URL}       https://www.advantageonlineshopping.com
${IMAGE_PATH}     img/imagem.jpg
${SOURCE}         web
${COLOR}          black

# Preencha com os valores fornecidos
${TOKEN}          eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ3d3cuYWR2YW50YWdlb25saW5lc2hvcHBpbmcuY29tIiwidXNlcklkIjo1Mjk2MjY1ODAsInN1YiI6Ikplc3NRQSIsInJvbGUiOiJVU0VSIn0.B8iZ-qrmpZiT5xr8vuSV7ugfeI4ZT7ZjrzZrqfbq2QU
${USER_ID}        529626580
${SESSION_ID}     1972dfe1783@7E9620F10^i%529626580

*** Keywords ***
Upload Imagem Produto
    [Arguments]        ${token}    ${user_id}
    [Documentation]    Faz upload de imagem de produto e retorna o id da imagem
    Create Session     upload    ${BASE_URL}
    ${headers}=        Create Dictionary    Authorization=Bearer ${token}    sessionId=${SESSION_ID}
    ${files}=          Create Dictionary    file=@${IMAGE_PATH}
    ${endpoint}=       Set Variable    /catalog/api/v1/product/image/${user_id}/${SOURCE}/${COLOR}
    ${response}=       POST On Session    upload    ${endpoint}    headers=${headers}    files=${files}    expected_status=any
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=           Evaluate    ${response.json()}    json
    ${image_id}=       Get From Dictionary    ${json}    id
    Should Not Be Empty    ${image_id}
    [Return]           ${image_id}

*** Test Cases ***
Upload de Imagem de Produto com Token e SessionId
    [Documentation]    Faz upload de imagem usando token e sessionId já fornecidos
    ${image_id}=    Upload Imagem Produto    ${TOKEN}    ${USER_ID}
    Log    Imagem enviada com sucesso. ID: ${image_id}