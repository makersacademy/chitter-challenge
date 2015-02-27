Given(/^I am on the user page$/) do
  visit '/user'
end

And(/^I fill the message space$/) do
  fill_in 'content', :with => "Hello, World!"
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content("Hello, World!")
end