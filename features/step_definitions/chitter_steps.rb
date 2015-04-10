Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I sign up as '(.*)'$/) do |name|
  fill_in :email, with: name
  click_button 'Sign Up'
end

Given(/^I have signed up as 'tansaku'$/) do
  step "I am on the homepage"
  step "I sign up as 'tansaku'"
  step "I see 'welcome tansaku'"
end

Given(/^I sign in as '(.*)'$/) do |name|
  fill_in :email, with: name
  click_button 'Sign In'
end

Then(/^I see '(.*)'$/) do |content|
  expect(page).to have_content content
end

Then(/^I do not see '(.*)'$/) do |content|
  expect(page).not_to have_content content
end

Given(/^no users are signed up$/) do
  Chitter::USERS = []
end
