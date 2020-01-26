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

#checkout
Given("add a product to the cart") do
    @purchase_page.viewProduct
    @purchase_page.addToCart
  end
  
  When("click to proceed to checkout") do
    @purchase_page.proceedCheckout
  end
  
  When("confirm the product") do
    @purchase_page.confirmProduct
  end
  
  When("confirm the adress") do
    @purchase_page.confirmAddress
  end
  
  When("agree to the terms") do
    @purchase_page.agreeTerm
  end
  
  When("confirm the shipping") do
    @purchase_page.confirmShipping
  end
  
  When("select the payment by bank wire") do
    @purchase_page.payByBank
  end
  
  When("confirm the order") do
    @purchase_page.confirmOrder
  end
  
  Then("the order is confirmed with the message {string} on the page") do |message|
    expect(@purchase_page.getMsgCompletedOrder).to eql message
  end

  
