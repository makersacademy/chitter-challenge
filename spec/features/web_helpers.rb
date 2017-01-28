def sign_up(name:, email:, password:, password_confirmation:)
  visit ('/')
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'sign up'
end

def sign_up_valid_details
  sign_up(
    name:                   'Test User Name',
    email:                  'test@test.com',
    password:               'qwerty',
    password_confirmation:  'qwerty')
end

def sign_up_empty_name
  sign_up(
    name:                   '',
    email:                  'test@test.com',
    password:               'qwerty',
    password_confirmation:  'qwerty')
end

def sign_up_wrong_password_confirmation
  sign_up(
    name:                   'Test User Name',
    email:                  'test@test.com',
    password:               'qwerty',
    password_confirmation:  'wrong')
end

def sign_up_empty_password
  sign_up(
    name:                   'Test User Name',
    email:                  'test@test.com',
    password:               '',
    password_confirmation:  'qwerty')
end

def sign_up_empty_email
  sign_up(
    name:                   'Test User Name',
    email:                  '',
    password:               'qwerty',
    password_confirmation:  'qwerty')
end

def sign_up_invalid_email
  sign_up(
    name:                   'Test User Name',
    email:                  'test@test',
    password:               'qwerty',
    password_confirmation:  'qwerty')
end

def sign_up_twice
  2.times { sign_up_valid_details }
end
