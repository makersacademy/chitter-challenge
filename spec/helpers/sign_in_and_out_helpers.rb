def sign_in(email, password)
  visit '/'
  click_button 'Sign In'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign In'
end

def sign_out
  click_button 'Sign Out'
end
