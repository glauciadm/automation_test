#cart
Given("access the home page") do
    @account_page.accessHome
end
  
When("click on the first product for sale on the page") do
    @purchase_page.viewProduct
end
  
When("add this product to the cart") do
    @purchase_page.addToCart
end
 
Then("the store show the message: {string}") do |message|
    expect(@purchase_page.getMsgAddCart).to eql message
end