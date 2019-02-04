def fill_in_registration
  click_button('Register!')
  fill_in('add_username', with: 'TestyMcTestFace')
  fill_in('add_email', with: 'test@email.com')
  fill_in('add_password', with: 'password')
end

def fill_in_login
  fill_in('user_em', with: 'test@email.com')
  fill_in('user_pw', with: 'password')
end

def fill_in_registration_two
  click_button('Register!')
  fill_in('add_username', with: 'TestTickles')
  fill_in('add_email', with: 'test2@email.com')
  fill_in('add_password', with: 'password')
end

def log_in_and_post
  fill_in('user_em', with: 'test@email.com')
  fill_in('user_pw', with: 'password')
  click_button('Login')
  # fill_in('add_peep', with: 'Howdy')
  # click_button('Peep!')
  click_button('Log Out!')
  fill_in('user_em', with: 'test2@email.com')
  fill_in('user_pw', with: 'password')
  click_button('Login')
end
