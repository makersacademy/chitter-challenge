Given(/^I sign up$/) do
  sign_up
end

def sign_up
  visit '/users/new'
  fill_in 'email', with: 'joejknowles@gmail.com'
  fill_in 'username', with: 'joejknowles'
  # fill_in 'password', with: 'secret'
  click_button 'Sign up'
end

Then(/^I see "([^"]*)"$/) do |string|
  expect(page).to have_content string
end
