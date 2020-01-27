*** Settings ***
Library       RequestsLibrary
Library       Collections


*** Variable ***
${URL_API}         https://jsonplaceholder.typicode.com


*** Keywords ***
#setup
Conect API
    Create Session      jsonplaceholder   ${URL_API}   

#action
Request all users
    ${RESPONSE}     Get Request     jsonplaceholder     /users
    log             ${RESPONSE.text}
    Set Test Variable       ${RESPONSE}

Validate status code
    [Arguments]         ${CORRECT_STATUSCODE}
    Should Be Equal As Strings      ${RESPONSE.status_code}      ${CORRECT_STATUSCODE}   

Validate reason                        
    [Arguments]         ${CORRECT_REASON}
    Should Be Equal As Strings      ${RESPONSE.reason}      ${CORRECT_REASON}     

Validate list with "${QT_USERS}" users
    Length Should Be    ${RESPONSE.json()}      ${QT_USERS}   

Request user "${ID_USER}"
    ${RESPONSE}     Get Request     jsonplaceholder     /users/${ID_USER}
    log             ${RESPONSE.text}
    Set Test Variable       ${RESPONSE}

    