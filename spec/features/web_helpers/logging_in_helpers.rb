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

def log_in_non_existing_user
  log_in(
    email:                  'no_user@test.com',
    password:               'qwerty')
end

def log_in_empty_email
  log_in(
    email:                  '',
    password:               'qwerty')
end

def log_in_non_valid_email
  log_in(
    email:                  'test@test.com',
    password:               'qwerty')
end

def log_in_empty_password
  log_in(
    email:                  'test@test.com',
    password:               '')
end
