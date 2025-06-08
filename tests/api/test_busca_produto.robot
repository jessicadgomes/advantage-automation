*** Settings ***
Library    RequestsLibrary
Library    BuiltIn
Library    String

*** Test Cases ***
Usuário busca um produto via API
    ${BASE_URL}=        Evaluate    __import__('dotenv').get_key('.env', 'BASE_URL')
    ${SEARCH_TERM}=     Set Variable    Mice
    ${ENDPOINT}=        Set Variable    /catalog/api/v1/products/search?name=${SEARCH_TERM}

    Create Session      shop    ${BASE_URL}
    ${response}=        Get Request    shop    ${ENDPOINT}
    Should Be Equal As Strings    ${response.status_code}    200

    ${response_text}=         Convert To String    ${response.text}
    ${response_text_lower}=   Convert To Lower Case    ${response_text}
    Should Contain            ${response_text_lower}    ${SEARCH_TERM.lower()}
