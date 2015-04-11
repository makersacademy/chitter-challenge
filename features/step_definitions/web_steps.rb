# Sign up

Given(/^I am in the sign up section$/) do
  visit '/users/new'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click "([^"]*)"$/) do |button_name|
  click_button(button_name)
end

Then(/^I see "([^"]*)"$/) do |message|
  expect(page).to have_content(message)
end

# Sign in

Given(/^the user "([^"]*)" exists$/) do |username|
  user_test = User.all(username: username).count
  expect(user_test).to be(1)
end

Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^the system correctly authenticates my "([^"]*)" and "([^"]*)"$/) do |username, password|
  username = 'saramoohead'
  password = 'password'
  expect(User.authenticate(username, password)).not_to be nil
end

# Sign out
Given(/^I am logged in$/) do
  log_in
end

Then(/^I do not see "([^"]*)"$/) do |message|
  expect(page).not_to have_content(message)
end

def register
  step "I am in the sign up section"
  step "I fill in \"username\" with \"saramoohead\""
  step "I fill in \"real_name\" with \"Sara OC\""
  step "I fill in \"email\" with \"saramoo@hotmail.com\""
  step "I fill in \"password\" with \"password\""
  step "I click \"Register\""
end

def log_in
  step "the user \"saramoohead\" exists"
  step "I am on the homepage"
  step "I fill in \"username\" with \"saramoohead\""
  step "I fill in \"password\" with \"password\""
  step "I click \"Sign in\""
  step "the system correctly authenticates my \"username\" and \"password\""
end

