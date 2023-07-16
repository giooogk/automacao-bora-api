*** Settings ***
Resource    ../src/library.robot
Resource    ../src/variables.robot

*** Keywords ***
Retornar ingressos
    ${response}    GET On Session    api    url=${TICKETS_URI}
    Set Suite Variable    ${response}    ${response.status_code}

Criar ingressos
    ${body}    Create Dictionary    price=100    name=robot event    type=estudante    
    ${response}    POST On Session    api    url=${TICKETS_URI}    json=${body}
    Set Suite Variable    ${response}    ${response.status_code}
    