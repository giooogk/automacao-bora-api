*** Settings ***
Resource    ../src/library.robot
Resource    ../src/variables.robot

*** Keywords ***
Retornar todos os eventos
    ${response}    GET On Session    api    url=${EVENTS_URI}
    # Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}

Retornar evento por id
    [Arguments]    ${id}

    ${response}    GET On Session    api    url=${EVENTS_URI}/${id}
    Set Suite Variable    ${response}    ${response.status_code}

Buscar por eventos
    ${params}     Create Dictionary    address=rua augusto severo    dateStart=08/07/2023 23:10    city=string    state=string    lowerTicketValue=80    upperTicketValue=100
    ${response}    GET On Session    api    url=${SEARCH_EVENTS_URI}    params=${params}
    # Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}

Criar evento
    ${locartion}    Create Dictionary    id=64a6e0a43cfc903a2ee10e06
    ${ticket}       Create Dictionary    id=64a6e1603cfc903a2ee10e0a
    ${body}         Create Dictionary    title=Robot test    organization=robot organization    status=done    favorite=treu    dateStart=08/07/2023 23:10    dateEnd=08/07/2023 23:50    location=${locartion}    ticket=${ticket}
    ${response}     POST On Session    api    url=${EVENTS_URI}    json=${body}
    # Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}