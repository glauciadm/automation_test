*** Settings ***
Library       RequestsLibrary
Library       Collections

*** Variable ***
${URL_API}         https://jsonplaceholder.typicode.com
&{USER_1}           id=1
...                 name=Leanne Graham
...                 username=Bret
...                 email=Sincere@april.biz


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

Validate user information
    Dictionary Should Contain Item      ${RESPONSE.json()}      id          ${USER_1.id}
    Dictionary Should Contain Item      ${RESPONSE.json()}      name        ${USER_1.name}
    Dictionary Should Contain Item      ${RESPONSE.json()}      username    ${USER_1.username}
    Dictionary Should Contain Item      ${RESPONSE.json()}      email       ${USER_1.email}

All users must have a name, username and email
    Should Not Be Empty         ${RESPONSE.json()["name"]}
    Should Not Be Empty         ${RESPONSE.json()["username"]}
    Should Not Be Empty         ${RESPONSE.json()["email"]}
    
Create a new post
    ${HEADERS}      Create Dictionary       content-type=application/json
    ${RESPONSE}     Post Request     jsonplaceholder         /posts 
    ...                              data={"userId": 1,"id": 1,"title": "sunt aut facere r","body": "quia et"}                    
    ...                              headers=${HEADERS} 
    log         ${RESPONSE.text}
    Set Test Variable       ${RESPONSE}

Validate status code - POST
    [Arguments]         ${CORRECT_STATUSCODE}
    Should Be Equal As Strings      ${RESPONSE.status_code}      ${CORRECT_STATUSCODE}

Post with empty title
    ${HEADERS}      Create Dictionary       content-type=application/json
    ${RESPONSE}     Post Request     jsonplaceholder         /posts 
    ...                              data={"userId": 1,"id": 1,"title": ,"body": "quia et"}                    
    ...                              headers=${HEADERS} 
    log         ${RESPONSE.text}
    Set Test Variable       ${RESPONSE}

Validate status code - Empty title
    [Arguments]         ${CORRECT_STATUSCODE}
    Should Be Equal As Strings      ${RESPONSE.status_code}      ${CORRECT_STATUSCODE}