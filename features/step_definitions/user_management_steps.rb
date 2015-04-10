Given(/^I visit the homepage$/) do
  visit '/'
end

When(/^I enter my details to signup$/) do
  fill_in('name', with: 'Samuel Russell Hampden Joseph')
  fill_in('email', with: 'sam@makersacademy.com')
  fill_in('username', with: 'tansaku')
  fill_in('password', with: 's3cret')
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^the number of users in the database should increase by (\d+)$/) do |arg1|
  expect(User.count).to eq(arg1.to_i)
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Given(/^I cannot see "([^"]*)"$/) do |arg1|
  expect(page).not_to have_content(arg1)
end

When(/^I enter Sams details to login$/) do
  fill_in('returning_email', with: 'sam@makersacademy.com')
  fill_in('returning_password', with: 's3cret')
end

When(/^I enter Dans details to login$/) do
  fill_in('returning_email', with: 'test@test.com')
  fill_in('returning_password', with: 'batman')
end

When(/^I enter Dans email incorrectly$/) do
  fill_in('returning_email', with: 'tesdt@test.com')
  fill_in('returning_password', with: 'batman')
end

When(/^I enter Dans password incorrectly$/) do
  fill_in('returning_email', with: 'test@test.com')
  fill_in('returning_password', with: 'satman')
end

Given(/^I have previously signed up as Samuel$/) do
  User.create(name: "Samuel Russell Hampden Joseph",
              email: "sam@makersacademy.com",
              username: 'tansaku',
              password: 's3cret')
end

Given(/^I have previously signed up as Dan$/) do
  User.create(name: "Dan",
              email: "test@test.com",
              username: 'tester_dan',
              password: 'batman')
end

Then(/^the number of users in the database should be (\d+)$/) do |arg1|
  expect(User.count).to be arg1.to_i
end

