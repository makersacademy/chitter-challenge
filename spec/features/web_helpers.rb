def sign_up(name, username, email, password, password_conf)
  visit ('/users/new')
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_conf', with: password_conf
  click_button 'Sign Up'
end

def sign_in
  email_address = 'test@test.com'
  password = 'test'
  visit ('/')
  fill_in 'email', with: email_address
  fill_in 'password', with: password
  click_button 'Sign In'
end
