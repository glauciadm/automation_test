#contact
Given("click to contact the store") do
    @home_page.makeContact
  end
  
  When("select a subject") do
    @contact_page.selectSubject
  end
  
  When("fill the email {string}") do |email|
    @contact_page.setEmail(email)
  end
  
  When("fill the order reference {string}") do |order|
    @contact_page.setOrder(order)
  end
  
  When("write the message text {string}") do |text|
    @contact_page.setMessageText(text)
  end
  
  When("send the message") do
    @contact_page.sendMessage
  end

  Then("a success message is displayed on the page: {string}") do |message|
    expect(@contact_page.getSuccessMsg).to eql message
  end