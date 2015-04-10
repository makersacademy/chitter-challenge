# Sign up

Given(/^I am on the homepage$/) do
  visit '/'
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
  expect(User.get(username)).to eq true
end

When(/^the system correctly authenticates me$/) do
  expect(User.authenticate). to eq true
end
