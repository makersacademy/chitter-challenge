def sign_up(user, email)
  fill_in :name, with: user
  fill_in :email, with: email
  click_button 'Submit'
end

def add_peep(message)
  fill_in :message, with: message
  click_button 'Submit'
end
