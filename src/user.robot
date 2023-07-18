*** Settings ***
Resource    ../src/library.robot
Resource    ../src/variables.robot
Resource    ../src/common.robot


*** Keywords ***
Consultar todos os usuários
    ${response}    GET On Session    api    url=${USER_URI}
    Set Suite Variable    ${response}    ${response.status_code}

Retornar todos os usuários
    ${response}    GET On Session    api    url=${USER_URI}
    Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}

Retornar usuário pelo email
    [Arguments]    ${email}
    
    ${response}    GET On Session    api    url=${USER_URI}/${email}
    Set Suite Variable    ${response}    ${response.status_code}

Criar usuário
    [Arguments]    ${type_authorities}

    @{authorities}    Create List    ${type_authorities}
    ${num}    Generate random string    4    abcdefghijklmnopqrstuvxz
    ${body}    Create Dictionary    login=robot${num}   name=robot${num}    email=robot${num}@email.com    telefone=5584999999999    authorities=${authorities}   password=1234
    ${response}    POST On Session    api    url=${CREATE_USER_URI}    json=${body}
    Set Suite Variable    ${response}    ${response.status_code}

Criar usuário com caracteres especiais
    [Arguments]    ${type_authorities}

    @{authorities}    Create List    ${type_authorities}
    ${num}    Generate random string    4    abcdefghijklmnopqrstuvxz
    ${body}    Create Dictionary    login=#4.%&robot${num}   name=#4.%&robot${num}    email=robot${num}@email.com    telefone=5584999999999    authorities=${authorities}   password=1234
    ${response}    POST On Session    api    url=${CREATE_USER_URI}    json=${body}    expected_status=ANY
    Set Suite Variable    ${response}    ${response.status_code}