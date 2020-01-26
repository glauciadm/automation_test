#login
Given("the user access the home page") do
  @home_page.access
end

When("click to sign in") do
  @home_page.accessSignin
end

When("fill the registered email {string}") do |email|
  @login_page.setEmail(email)
end

When("fill the password {string}") do |password|
  @login_page.setPassword(password)
end

When("submit login") do
  @login_page.clickSubmit
end

Then("the message {string} is displayed on the page") do |message|
  expect(@account_page.getAccountMsg).to eql message
end

#logout
Given("is logged on the system") do
  @home_page.accessSignin
  @login_page.loginDefault
end

When("click to sign out the account") do
  @home_page.accessSignout
end

Then("the option {string} is desappeared") do |option|
  expect(page).to have_no_link(option)
end

Then("the option {string} is displayed on the page") do |option|
  expect(page).to have_link(option)
end

#createAccount
When("fill the new email {string}") do |email|
  @login_page.createEmail(email)
end

When("click to create the account") do
  @login_page.createAccount
end

Then("the error message {string} is displayed on the page") do |message|
  expect(@login_page.getErrorMsg).to eql message
end

Then("is displayed a page to register the account") do 
  expect(page).to have_current_path('http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation', url: true)
end

#forgotPassord
When("click to forgot password") do
  @login_page.getPassword
end

When("click to retrieve password") do
  @login_page.retrievePassword
end

Then("a confirmation message is displayed on the page: {string}") do |message|
  expect(@login_page.getRetrievePasswordMsg).to eql message
end