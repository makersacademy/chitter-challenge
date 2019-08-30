def sign_in
  visit '/'
  click_button 'Sign in'
  fill_in(:email, with: 'admin@chitter.com')
  fill_in(:password, with: 'password1234')
  click_button 'Sign in'
end
