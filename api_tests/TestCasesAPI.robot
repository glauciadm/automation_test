*** Settings ***
Resource      ResourceAPI.robot
Suite Setup   Conect API

*** Test Cases ***
Request all users
    Request all users
    Validate status code      200  
    Validate reason           OK
    Validate list with "10" users

Request an user
    Request user "1"
