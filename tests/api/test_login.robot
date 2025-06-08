*** Settings ***
Library    RequestsLibrary
Library    BuiltIn

*** Test Cases ***
Login Usuário ADMIN Existente
    ${BASE_URL}=       Evaluate    __import__('dotenv').get_key('.env', 'BASE_URL')
    ${EMAIL}=          Evaluate    __import__('dotenv').get_key('.env', 'ADMIN_EMAIL')
    ${PASSWORD}=       Evaluate    __import__('dotenv').get_key('.env', 'ADMIN_PASSWORD')
    ${USERNAME}=       Evaluate    __import__('dotenv').get_key('.env', 'ADMIN_USERNAME')

    ${headers}=        Create Dictionary    Content-Type=application/json
    Create Session     advantage    ${BASE_URL}/accountservice/accountrest/api/v1    headers=${headers}    verify=False

    ${body}=           Create Dictionary
    ...    email=${EMAIL}
    ...    loginPassword=${PASSWORD}
    ...    loginUser=${USERNAME}

    ${response}=       POST On Session    advantage    /login    json=${body}    expected_status=any
    Log                ${response.status_code}
    Log                ${response.text}
