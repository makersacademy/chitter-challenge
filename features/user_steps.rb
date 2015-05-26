When(/^I enter "([^"]*)" in "([^"]*)"$/) do |text, fieldname|
  fill_in(fieldname, with: text)
end

When(/^I click "([^"]*)"$/) do |button|
  click_button(button)
end

#doesn't use 'user'
Given(/^I signup as "([^"]*)"$/) do |user|
  visit('/')
  click_link("Register")
  fill_in("fullname", with: "bob smith")
  fill_in("email", with: "bob@gmail.com")
  fill_in("username", with: "bobster")
  fill_in("password", with: "password")
  fill_in("password_confirmation", with: "password")
  click_button("Sign up")
end

#doesn't use 'user'
Given(/^I log in as "([^"]*)"$/) do |user|
  visit('/')
  click_button("Sign in")
  fill_in("email", with: "bob@gmail.com")
  fill_in("password", with: "password")
  click_button("Sign in")
end


