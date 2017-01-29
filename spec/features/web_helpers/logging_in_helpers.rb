def log_in(email:, password:)
  visit ('/')
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'log in'
end

def log_in_existing_user
  log_in(
    email:                  'test@test.com',
    password:               'qwerty')
end
