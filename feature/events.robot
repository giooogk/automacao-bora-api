*** Settings ***
Resource    ../src/common.robot
Resource    ../src/events.robot

*** Test Cases ***
Cenário: Retornar todo os eventos
    Conectar com autenticação básica na API
    Retornar todos os eventos
    Validar status code    ${STATUS_200}

Cenário: Retornar evento por id
    Conectar com autenticação básica na API
    Retornar evento por id    64b02800e4053c430097f618
    Validar status code    ${STATUS_200}


Cenário: Buscar por um evento
    Conectar com autenticação básica na API
    Buscar por eventos
    Validar status code    ${STATUS_200}

Cenário: Criar evento
    Conectar com autenticação básica na API
    Criar evento
    Validar status code    ${STATUS_201}