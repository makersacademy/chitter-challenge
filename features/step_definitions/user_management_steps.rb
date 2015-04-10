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
