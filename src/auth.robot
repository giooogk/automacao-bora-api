*** Settings ***
Resource    ../src/library.robot
Resource    ../src/variables.robot

*** Keywords ***
Autenticar
    ${body}    Create Dictionary    email=admin    password=admin
    ${response}    POST On Session    alias=api    url=${AUTH_URI}   json=${body}
    # Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}

Logar com senha incorreta
    ${body}    Create Dictionary    email=admin    password=skjsd
    ${response}    POST On Session    alias=api    url=${AUTH_URI}   json=${body}
    # Log To Console    ${response.json()}
    Set Suite Variable    ${response}    ${response.status_code}