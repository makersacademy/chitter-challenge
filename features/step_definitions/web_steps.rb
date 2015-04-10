Given(/^I sign up$/) do
  sign_up
end

def sign_up(email = 'joejknowles@gmail.com',
            username = 'joejknowles',
            password = 'secret',
            password_confirm = 'secret')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirm', with: password_confirm
  click_button 'Sign up'
end

Then(/^I see "([^"]*)"$/) do |string|
  expect(page).to have_content string
end

Given(/^I sign up with mismatched passwords$/) do
  sign_up('joejknowles@gmail.com', 'joejknowles', 'secret', 'incorrect')
end