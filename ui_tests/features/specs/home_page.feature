Feature: Home page

    @signin
    Scenario: Sing in
        Given the user acess the home page
        When click to sign in 
        And fill the email 'glaucia.admachado@gmail.com'
        And fill the password 'abc123'
        And submit the login
        Then is displayed the message 'Welcome to your account. Here you can manage all of your personal information and orders.'


