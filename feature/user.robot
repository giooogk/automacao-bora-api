*** Settings ***
Resource    ../src/common.robot
Resource    ../src/user.robot
    
*** Test Cases ***
Cenário: Listar usuários
    Conectar com autenticação básica na API
    Consultar todos os usuários
    Validar status code    ${STATUS_200}

Cenário: Retornar usuário informando email
    Conectar com autenticação básica na API
    Retornar usuário pelo email    testando@testemail.com
    Validar status code    ${STATUS_200}

Cenário: Criar usuário
    Conectar com autenticação básica na API
    Criar usuário    ROLE_GENERAL_USER
    Validar status code    ${STATUS_201}

Cenário: Criar usuário com caracteres especiais
    Conectar com autenticação básica na API
    Criar usuário com caracteres especiais    ROLE_GENERAL_USER
    Validar status code    ${STATUS_401}