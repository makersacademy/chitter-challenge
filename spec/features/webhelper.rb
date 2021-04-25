def sign_up_and_submit 
  fill_in 'email', with: 'test_email' 
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Kane'
  fill_in 'username', with: 'username_test'
  click_button 'Submit'
end