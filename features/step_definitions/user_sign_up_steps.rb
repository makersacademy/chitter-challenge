Given(/^I visit the sign\-up page$/) do
  visit '/users/new'
end

And(/^I type my email adress, name and password$/) do
  fill_in 'email', :with => 'aaa@email.com'
  fill_in 'name', :with => 'John117'
  fill_in 'password', :with => '0451'
end

When(/^I click on sign up$/) do
  click_on 'sign up'
end

Then(/^I should see my name on the page$/) do
  expect(page).to have_content('Welcome John117')
end
