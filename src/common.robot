*** Settings ***
Resource    ../src/variables.robot
Resource    ../src/library.robot

*** Keywords ***
Conectar com autenticação básica na API
    ${AUTH}             Create List           ${MY_USER}      ${MY_PASS}
    Create Session    api    url=${HOST_API}    auth=${AUTH}      disable_warnings=True

Validar status code
    [Arguments]    ${status}
    Should Be Equal    ${status}   ${response}