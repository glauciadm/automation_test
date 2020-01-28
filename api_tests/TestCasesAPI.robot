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

Create a new post (POST)
    Create a new post
    Validate status code - POST     201 

Create a post with empty title
    Post with empty title
    Validate status code - Empty title        400