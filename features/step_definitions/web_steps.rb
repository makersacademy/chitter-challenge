require 'cucumber/rspec/doubles'

Given(/^I sign up$/) do
  visit '/users/new'
  sign_up
end

Then(/^I see "([^"]*)"$/) do |string|
  expect(page).to have_content string
end

When(/^I see "([^"]*)", followed by "([^"]*)"$/) do |first, second|
  expect(page).to have_selector "div:nth-child(1)", text: first
  expect(page).to have_selector "div:nth-child(2)", text: second
end

Given(/^I sign up with mismatched passwords$/) do
  visit '/users/new'
  sign_up('joejknowles@gmail.com', 'joejknowles', 'secret', 'incorrect')
end

When(/^I sign out$/) do
  click_button('Sign out')
end

Then(/^I don't see "([^"]*)"$/) do |string|
  expect(page).not_to have_content string
end

Then(/^I sign in$/) do
  visit '/sessions/new'
  sign_in
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, text|
  fill_in field, with: text
end

When(/^I press the "([^"]*)" button$/) do |button|
  click_button(button)
end

When(/^I set the time to "([^"]*)" minutes ago$/) do |minutes|
  fake_time = Time.now - (minutes.to_i * 60)
  allow_any_instance_of(Cheep).to receive(:time_stamp) { fake_time }
end

Given(/^I'm on the "([^"]*)" page$/) do |page|
  page = '' if page == 'home'
  visit "/#{page}"
end

Then(/^I sign up from this page$/) do
  sign_up
end

Then(/^I log in from this page$/) do
  sign_in
end

Given(/^I sign up with short password$/) do
  visit '/users/new'
  sign_up('joejknowles@gmail.com', 'joejknowles', 'short', 'short')
end

Then(/^I receive welcome email on sign up$/) do
  expect(SendMail).to receive(:send_welcome).and_return('test')
  visit '/users/new'
  sign_up
end

Given(/^I block mailgun$/) do
  allow(RestClient).to receive(:post).and_return('test')
end

Then(/^I don't see the "([^"]*)" button$/) do |_button|
  expect(page).to have_button button, disabled: true
end

Given(/^Fred signs up$/) do
  visit '/users/new'
  sign_up('joejknowles@example.com',
          'fred',
          'secret',
          'secret')
end

Then(/^I see element "([^"]*)" with text "([^"]*)"$/) do |selector, text|
  expect(page).to have_selector selector, text: text
end

def sign_in(username = 'joejknowles',
            password = 'secret')
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign in'
end

def sign_up(email = 'joejknowles@gmail.com',
            username = 'joejknowles',
            password = 'secret',
            password_confirm = 'secret')
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirm', with: password_confirm
  click_button 'Sign up'
end