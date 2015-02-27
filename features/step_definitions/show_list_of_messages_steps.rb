Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should be able to see a list of messages$/) do
  expect(page).to have_content(message_list)
end