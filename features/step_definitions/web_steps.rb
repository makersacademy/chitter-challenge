Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end