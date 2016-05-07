def sign_up(username = 'user1', email = 'user@email.com', password='password')
  visit '/sign-up'
  fill_in 'name', with: 'Matt'
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end

def sign_in(username, password)
  visit '/sign-in'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign in'
end

def peep(message)
  visit '/user/peep'
  fill_in 'peep', with: message
  click_button 'Peep!'
end
