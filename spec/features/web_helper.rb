def sign_up_and_submit 
  click_button 'Sign up'
  fill_in 'email', with: 'test_email' 
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Kane'
  fill_in 'username', with: 'username_test'
  click_button 'Submit'
end

def sign_in
  click_button 'Sign in'
  fill_in 'username', with: 'username_test'
  fill_in 'password', with: 'password'
  click_button 'Submit'
end
