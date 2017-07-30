def post_peep(message = "My first peep!")
  sign_up
  visit('/peeps')
  fill_in 'peep', with: message
  click_button 'Peep'
end

def sign_up(email: 'user@user.com', password: '1234', password_confirmation: '1234', name: 'New user', username: 'newuser')
  visit('/sign_up')
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end
