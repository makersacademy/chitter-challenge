def sign_up_bob
  click_button 'sign up'
  fill_in(:name, with: 'Bob')
  fill_in(:username, with: 'smallbadger')
  fill_in(:email, with: 'bobthebadger@hotmail.com')
  fill_in(:password, with: 'Badger123')
  click_button 'submit'
end

def create_message(message)
  click_button 'Add a new message'
  fill_in('message', with: message)
  click_on('add')
end
