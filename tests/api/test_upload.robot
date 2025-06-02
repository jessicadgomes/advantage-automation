*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}      https://www.advantageonlineshopping.com
${ENDPOINT}      /catalog/api/v1/product/image/645996510/img/red
${TOKEN}         Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ3d3cuYWR2YW50YWdlb25saW5lc2hvcHBpbmcuY29tIiwidXNlcklkIjo2NDU5OTY1MTAsInN1YiI6IkJFUk5BUkRPVCIsInJvbGUiOiJBRE1JTiJ9.GP4gzb983_Yjw8xjCvDNRN56yJQCcIExSeDXeriEsM4
${IMAGE_PATH}    C:/Users/jessi/projetos/advantage-automation/tests/api/resources/img/imagem.jpg

*** Test Cases ***
Upload Imagem Para Produto
    Create Session    shopping    ${BASE_URL}
    &{headers}=    Create Dictionary    Authorization=${TOKEN}
    &{params}=     Create Dictionary    product_id=1
    &{files}=      Create Dictionary    file=${IMAGE_PATH}
    ${response}=   POST On Session    shopping    ${ENDPOINT}    headers=${headers}    params=${params}    files=${files}
    Log    Status code: ${response.status_code}
    Log    Response body: ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200