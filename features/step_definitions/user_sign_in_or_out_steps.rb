Given(/^I click on "(.*?)"$/) do |arg1|
  visit '/'
  click_on 'sign in'
end

When(/^I fill in the spaces provided$/) do
  fill_in 'name', :with => 'John117'
  fill_in 'password', :with => '0451'
  click_on 'log in'
end

Then(/^I should be able to see my username on screen$/) do
  expect(page).to have_content("John117")
end

When(/^I click "(.*?)"$/) do |arg1|
  visit '/'
  click_on 'sign out'
end

Then(/^I should be logged out$/) do
  expect(page).to have_content("Please sign up")
end