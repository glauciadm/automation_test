Given("the user access the home page") do
  @home_page.access
end

When("click to sign in") do
  @home_page.accessSignin
end

When("fill the email {string}") do |email|
  @login_page.setEmail(email)
end

When("fill the password {string}") do |password|
  @login_page.setPassword(password)
end

When("submit login") do
  @login_page.clickSubmit
end

Then("the message {string} is displayed on the page") do |message|
  expect(@login_page.getAccountMsg).to eql message
end

