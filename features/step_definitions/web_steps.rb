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

Given(/^the session username is "([^"]*)"$/) do |username|
  p '*' * 20
  p session.inspect
  expect(session.inspect).to_include username
end

Then(/^I do not see "([^"]*)"$/) do |message|
  expect(page).not_to have_content(message)
end