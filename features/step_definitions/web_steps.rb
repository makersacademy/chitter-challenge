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

Then(/^"([^"]*)" is not entered into the database$/) do |username|
  user_test = User.all(username: username).count
  expect(user_test).to eq(1)
end

# Sign in

Given(/^the user "([^"]*)" exists$/) do |username|
  user_test = User.all(username: username).count
  expect(user_test).to eq(1)
end

Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^my "([^"]*)" and "([^"]*)" are authenticated$/) do |username, password|
  username = 'saramoohead'
  password = 'password'
  expect(User.authenticate(username, password)).not_to be nil
end

# Sign out
Given(/^I log in$/) do
  log_in
end

Then(/^I do not see "([^"]*)"$/) do |message|
  expect(page).not_to have_content(message)
end

# Peep
Then(/^I create a new Peep$/) do
  expect(Peep.all.count).to eq(1)
end

# def register
#   step "I am in the sign up section"
#   step "I fill in \"username\" with \"saramoohead\""
#   step "I fill in \"real_name\" with \"Sara OC\""
#   step "I fill in \"email\" with \"saramoo@hotmail.com\""
#   step "I fill in \"password\" with \"password\""
#   step "I click \"Register\""
# end

def log_in
  step "the user \"saramoohead\" exists"
  step "I am on the homepage"
  step "I fill in \"username\" with \"saramoohead\""
  step "I fill in \"password\" with \"password\""
  step "I click \"Sign in\""
  step "my \"username\" and \"password\" are authenticated"
end


