Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I sign up as 'tansaku'$/) do
  fill_in :email, with: 'tansaku@gmail.com'
end

Then(/^I see 'welcome tansaku'$/) do
  expect(page).to have_content 'welcome tansaku'
end