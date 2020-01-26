Feature: Make purchase

    Background:
        Given the user access the home page

    @cart
    Scenario: Add a product to the cart
        And is logged on the system
        And access the home page
        When click on the first product for sale on the page
        And add this product to the cart
        Then the store show the message: 'Product successfully added to your shopping cart'

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