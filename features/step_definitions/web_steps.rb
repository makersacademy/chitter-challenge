Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I visit the "(.*?)" page$/) do |page|
  visit page
end

When(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should be at the "(.*?)" page$/) do |page|
  expect(current_path).to eq(page)
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  expect(page).not_to have_content(content)
end

Given(/^I am on the Sign Up page$/) do
  visit '/users/sign_up'
end

Given(/^I am on the sign in page$/) do
  visit '/users/sign_in'
end

Given(/^I am logged in with a current user account$/) do
  visit '/users/sign_up'
  fill_in "name", with: "Tom"
  fill_in "email", with: "tomcoakes@gmail.com"
  fill_in "password", with: "password100"
  fill_in "password_confirmation", with: "password100"
  click_button("Create Account")
end

Given(/^I have previously created an account$/) do
  visit '/users/sign_up'
  fill_in "name", with: "Tom"
  fill_in "username", with: "cheep-boy"
  fill_in "email", with: "tomcoakes@gmail.com"
  fill_in "password", with: "password100"
  fill_in "password_confirmation", with: "password100"
  click_button("Create Account")
  click_link("Sign Out")
end

When(/^I enter "(.*?)" into the "(.*?)" field$/) do |content, field|
  fill_in field, with: content
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Given(/^cheeps have already been posted$/) do
  visit '/users/sign_up'
  fill_in "name", with: "Tom"
  fill_in "username", with: "cheep-boy"
  fill_in "email", with: "tomcoakes@gmail.com"
  fill_in "password", with: "password100"
  fill_in "password_confirmation", with: "password100"  
  click_button("Create Account")
  click_link("Post a new Cheep")
  fill_in "content", with: "Hello World!"
  click_button("Post")
  click_link("Sign Out")
end