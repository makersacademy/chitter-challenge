
def user
    User.create(name: 'User McUser',
    username: 'alias',
    email: 'user@example.com',
    password: 'secret1234',
    password_confirmation: 'secret1234')
end

#PEEP
def peep_once
  sign_up
  click_button 'Peep!'
  fill_in :body, with: 'first peep!'
  click_button 'Peep it!'
end


# LOG IN
def sign_in(email, password)
  visit '/'
  click_button 'Log in'
  fill_in :email, with: email
  fill_in :password, with: password
  within('.login') do
  click_button("Log in")
  end
end

# SIGN UP
def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'user@test.com'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  within('.signup') do
  click_button("Sign up")
  end
end

def sign_up_wrong_passwords
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'user@test.com'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'NOT_CORRECT'
  within('.signup') do
  click_button("Sign up")
  end
end

def no_email
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: ''
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  within('.signup') do
  click_button("Sign up")
  end
end

def invalid_email
  visit '/'
  click_button 'Sign up'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'hej@hej'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  within('.signup') do
  click_button("Sign up")
  end
end
