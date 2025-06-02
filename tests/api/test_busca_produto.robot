*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${BASE_URL}                    https://www.advantageonlineshopping.com
${SEARCH_ENDPOINT}             /catalog/api/v1/products/search?name=Mice

*** Test Cases ***
Usuário busca um produto via API
    [Documentation]    Busca um produto específico e verifica a resposta da API
    Create Session    shop    ${BASE_URL}
    ${response}=    Get Request    shop    ${SEARCH_ENDPOINT}
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_text}=    Convert To String    ${response.text}
    ${response_text_lower}=    Convert To Lower Case    ${response_text}
    Should Contain    ${response_text_lower}    mice