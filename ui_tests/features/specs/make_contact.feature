Feature: Make Contact

    Background:
        Given the user access the home page

    @contact @automatized
    Scenario: Send a message
        And click to contact the store
        When select a subject
        And fill the email 'oldstore@mystore.com'
        And fill the order reference '123456'
        And write the message text 'I dont receive my order'
        And send the message
        Then a success message is displayed on the page: 'Your message has been successfully sent to our team.'