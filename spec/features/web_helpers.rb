def add_peep(message)
  visit '/'
  click_button 'peeps'
  click_button 'Add peep'
  fill_in 'content', with: message
  click_button 'Submit'
end

def sign_up(email, password, password_confirmation, name, username)
  visit '/'
  click_button 'Sign up'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'confirm_password', with: password_confirmation
  fill_in 'name', with: name
  fill_in 'username', with: username
  click_button 'Submit'
end
