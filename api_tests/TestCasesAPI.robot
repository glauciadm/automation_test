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
    Validate user information
    All users must have a name, username and email

Company name should be <=50 characters 
    Company name length "<=50"