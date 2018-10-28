
def sign_up
  visit '/'
  click_on 'sign up'
  fill_in 'first name', with: 'Oli'
  fill_in 'surname', with: 'Smith'
  fill_in 'email', with: 'fakeemail@123.com'
  fill_in 'username', with: 'Oli'
  fill_in 'password', with: 'crappassword'
  click_on 'sign me up!'
end

def peep(message)
  fill_in 'peep', with: message
  click_on 'submit peep'
end

def log_in(username = 'Becka')
  visit '/'
  fill_in 'username', with: username
  fill_in 'password', with: 'fakepassword'
  click_on 'log in'
end

def peep(message)
  fill_in 'peep', with: message
  click_on 'submit peep'
end

def sign_in(wrong_password = false)
  visit '/'
  fill_in 'username', with: 'Becka'
  password = wrong_password ? 'wrongpassword' : 'fakepassword'
  fill_in 'password', with: password
  click_on 'log in'
end
