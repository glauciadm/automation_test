Feature: Make purchase

    Background:
        Given the user access the home page
        And is logged on the system
        And access the home page

    @cart @automatized
    Scenario: Add a product to the cart
        When click on the first product for sale on the page
        And add this product to the cart
        Then the store show the message: 'Product successfully added to your shopping cart'

    @checkout @automatized
    Scenario: Proceed to checkout
        And add a product to the cart
        When click to proceed to checkout
        And confirm the product
        And confirm the adress
        And agree to the terms
        And confirm the shipping
        And select the payment by bank wire
        And confirm the order
        Then the order is confirmed with the message 'Your order on My Store is complete.' on the page