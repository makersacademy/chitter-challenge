Given(/^I am on the homepage$/) do
  visit '/'
end

And(/^I fill the message space$/) do
  fill_in :message, :with => "Hello, World!"
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content("message sent")
end