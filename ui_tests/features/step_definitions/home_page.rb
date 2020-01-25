Given("the user acess the home page") do
  @login_page.acess
end

When("click to sign in") do
  @login_page.signinLink
end

When("fill the email {string}") do |email|
  @login_page.email(email)
end

When("fill the password {string}") do |password|
  @login_page.password(password)
end

When("submit the login") do
  @login_page.signinSubmit
end

Then("is displayed the message {string}") do |message|
  expect(@login_page.infoAccount).to eql message
end