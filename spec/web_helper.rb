def sign_up_good
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: 'Charlie Hines'
  fill_in 'email', with: 'chalk@bag.com'
  fill_in 'username', with: 'SidTheSloth'
  fill_in 'password', with: 'hello'
  fill_in 'password_confirm', with: 'hello'
  click_button 'Submit'
end

def sign_up_invalid
  visit '/'
  click_button 'Sign Up'
  fill_in 'name', with: 'Charlie Hines'
  fill_in 'email', with: 'chalk'
  fill_in 'username', with: 'SidTheSloth'
  fill_in 'password', with: 'hello'
  fill_in 'password_confirm', with: 'hello'
  click_button 'Submit'
end
