def sign_up
  fill_in 'email', with: 'f@ke.email'
  fill_in 'username', with: 'EllieWem'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end

def sign_up_wrong_password
  fill_in 'email', with: 'f@ke.email'
  fill_in 'username', with: 'EllieWem'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'wrongpassword'
  click_button 'Sign up'
end
