*** Settings ***
Resource    ../src/common.robot
Resource    ../src/tickets.robot

*** Test Cases ***
Cenário: Listar ingressos
    Conectar com autenticação básica na API
    Retornar ingressos
    Validar status code    ${STATUS_200}

Cenário: Criar ingressos
    Conectar com autenticação básica na API
    Criar ingressos
    Validar status code    ${STATUS_201}