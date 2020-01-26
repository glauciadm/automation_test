Feature: Manage Account

    Background:
        Given the user access the home page

    @login @automatized
    Scenario: Sign in
        When click to sign in
        And fill the registered email 'glaucia.admachado@gmail.com'
        And fill the password 'abc123'
        And submit login
        Then the message 'Welcome to your account. Here you can manage all of your personal information and orders.' is displayed on the page

    @logout @automatized
    Scenario: Sign out
        And is logged on the system
        When click to sign out the account
        Then the option 'Sign out' is desappeared
        And the option 'Sign in' is displayed on the page

    @invalidCreate @automatized
    Scenario Outline: Create an account with an invalid email
        When click to sign in
        And fill the new email "<email>"
        And click to create the account
        Then the error message 'Invalid email address.' is displayed on the page

        Examples:
            | email       |
            | store@      |
            | store@store |
            | store.com   |
            | store       |
            | store@com.  |
            | @store.com  |

    @validCreate @automatized
    Scenario: Create an account with a valid email
        When click to sign in
        And fill the new email 'mystore@story.com'
        And click to create the account
        Then is displayed a page to register the account

    @forgotPassword @automatized
    Scenario: Retrieve password
        When click to sign in
        And click to forgot password
        And fill the registered email 'glaucia.admachado@gmail.com'
        And click to retrieve password
        Then a confirmation message is displayed on the page: 'A confirmation email has been sent to your address: glaucia.admachado@gmail.com' 

    @accountData
    Scenario: Fill the account data
        And filled a email to create an account
        When fill the required fields
            | firstName   |
            | lastName    |
            | password    |
            | adress      |
            | city        |
            | state       |
            | postalCode  |
            | mobilePhone |
            | alias       |
        And click to register
        Then the message 'Welcome to your account. Here you can manage all of your personal information and orders.' is displayed on the page

    

    @newsletter
    Scenario: Subscribe to the newsletter
        When fill the email 'newstore@mystore.com'
        And submit the subscribe
        Then the message 'Newsletter : You have successfully subscribed to this newsletter' is displayed on the page