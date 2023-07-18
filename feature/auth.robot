*** Settings ***
Documentation    testes com a rota de autenticação
Resource         ../src/auth.robot
Resource         ../src/common.robot

*** Test Cases ***
Cenário: Login
    Conectar com autenticação básica na API
    Autenticar
    Validar status code    ${STATUS_200}

Cenário: Logar com senha incorreta
    Conectar com autenticação básica na API
    Logar com senha incorreta
    Validar status code    ${STATUS_400}