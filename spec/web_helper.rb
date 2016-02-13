def sign_up_good
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: 'Charlie Hines'
  fill_in 'email', with: 'chalk@bag.com'
  fill_in 'username', with: 'SidTheSloth'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
  click_button 'Submit'
end

def sign_up_invalid
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: 'Charlie Hines'
  fill_in 'email', with: 'chalk'
  fill_in 'username', with: 'SidTheSloth'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
  click_button 'Submit'
end

def sign_up_password_fail
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: 'Charlie Hines'
  fill_in 'email', with: 'chalk@bag.com'
  fill_in 'username', with: 'SidTheSloth'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Submit'
end
