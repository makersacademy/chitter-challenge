def sign_up(user, email, password, password_confirmation)
  fill_in :name, with: user
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Submit'
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def add_peep(message)
  fill_in :message, with: message
  click_button 'Submit'
end
