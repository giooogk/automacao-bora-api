*** Settings ***
Resource    ../src/library.robot
Resource    ../src/variables.robot

*** Keywords ***
Retornar localizações
    ${response}    GET On Session    api    url=${LOCATION_URI}
    Set Suite Variable    ${response}    ${response.status_code}

Criar localização
    ${body}    Create Dictionary    latitude=0    longitude=0    number=string    address=string    city=string    state=string    country=string
    ${response}    POST On Session    api    url=${LOCATION_URI}    json=${body}
    Set Suite Variable    ${response}    ${response.status_code}