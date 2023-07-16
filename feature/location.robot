*** Settings ***
Resource    ../src/common.robot
Resource    ../src/location.robot

*** Test Cases ***
Cenário: Listar todas localizações
    Conectar com autenticação básica na API
    Retornar localizações
    Validar status code    ${STATUS_200}

Cenário: Criar localização
    Conectar com autenticação básica na API
    Criar localização
    Validar status code    ${STATUS_201}