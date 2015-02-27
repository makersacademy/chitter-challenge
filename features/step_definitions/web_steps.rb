Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  expect(page).not_to have_content(content)
end

Given(/^I am on the sign up\/sign in page$/) do
  visit '/users/sign_in'
end

When(/^I enter "(.*?)" into the "(.*?)" field$/) do |content, field|
  fill_in field, with: content
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end