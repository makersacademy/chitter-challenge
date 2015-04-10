Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I sign up as '(.*)'$/) do |name|
  fill_in :email, with: name
  click_button 'Sign Up'
end

Then(/^I see '(.*)'$/) do |content|
  expect(page).to have_content content
end

Then(/^I do not see '(.*)'$/) do |content|
  expect(page).not_to have_content content
end
