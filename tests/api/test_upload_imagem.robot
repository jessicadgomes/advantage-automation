*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn

*** Test Cases ***
Upload Imagem Para Produto
    ${BASE_URL}=    Evaluate    __import__('dotenv').get_key('.env', 'BASE_URL')
    ${ENDPOINT}=    Evaluate    __import__('dotenv').get_key('.env', 'ENDPOINT')
    ${TOKEN}=       Evaluate    __import__('dotenv').get_key('.env', 'AUTH_TOKEN')
    ${IMAGE_PATH}=  Evaluate    __import__('dotenv').get_key('.env', 'IMAGE_PATH')
    ${PRODUCT_ID}=  Evaluate    __import__('dotenv').get_key('.env', 'PRODUCT_ID')

    File Should Exist    ${IMAGE_PATH}
    Create Session    shopping    ${BASE_URL}
    &{headers}=    Create Dictionary    Authorization=${TOKEN}
    &{params}=     Create Dictionary    product_id=${PRODUCT_ID}

    ${file}=    Evaluate    open(r'''${IMAGE_PATH}''', 'rb')
    &{files}=   Create Dictionary    file=${file}
    ${response}=    Post Request    shopping    ${ENDPOINT}    headers=${headers}    params=${params}    files=${files}
    Log    Status code: ${response.status_code}
    Log    Response body: ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
