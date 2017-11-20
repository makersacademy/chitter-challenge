def sign_up(name, username, email, password, password_confirmation)
  visit '/users/new'
  click_button 'Sign Up'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(username, password)
  visit '/sessions/new'
  click_button('Sign In')
  fill_in('email', with: username)
  fill_in('password', with: password)
  click_button('Sign In')
end
