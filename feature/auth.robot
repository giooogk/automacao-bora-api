*** Settings ***
Documentation    testes com a rota de autenticação
Resource         ../src/auth.robot
Resource         ../src/common.robot

*** Test Cases ***
Cenário: Login
    Conectar com autenticação básica na API
    Autenticar
    Validar status code    ${STATUS_200}