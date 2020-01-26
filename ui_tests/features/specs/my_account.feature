Feature: My Account

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

    @forgotPassword
    Scenario: Retrieve password
        When click to sign in
        And click to recover password
        And fill the registered email 'glaucia.admachado@gmail.com'
        And click to retrieve password
        Then the message 'A confirmation email has been sent to your address' is displayed on the page

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

    @cart
    Scenario: Add a product to the cart
        And is logged on the system
        When add the second iten's page to the cart
        Then the message 'Product successfully added to your shopping cart' is displayed on the page

    @checkout
    Scenario Outline: Proceed to checkout
        And is logged on the system
        And add a product to the cart
        When click to proceed to checkout
        And confirm the product
        And confirm the adress
        And agree to the terms
        And confirm the shipping
        And select the payment <payment>
        And confirm the order
        Then the message 'Your order on My Store is complete.' is displayed on the page

        Examples:
            | payment          |
            | Pay by bank wire |
            | Pay by check     |

    @newsletter
    Scenario: Subscribe to the newsletter
        When fill the email 'newstore@mystore.com'
        And submit the subscribe
        Then the message 'Newsletter : You have successfully subscribed to this newsletter' is displayed on the page

    @contact
    Scenario: Send a message
        And click to contact the store
        When select a subject
        And fill the email 'oldstore@mystore.com'
        And fill the order reference '123456'
        And write the message text
        And send the message
        Then the message 'Your message has been successfully sent to our team.' is displayed on the page