def sign_up
  fill_in('user_name', with: 'J')
  fill_in('name', with: 'John')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  find('button.sign-up').click
end

def sign_in_correct
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  find('button.sign-in').click
end

def sign_in_incorrect
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'ciao')
  find('button.sign-in').click
end

def log_out
  visit('/')
  find('button.sign-in').click
  sign_in_correct
  find('button.log-out').click
end
