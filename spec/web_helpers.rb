def sign_up
  visit '/'
  click_button 'sign up'
  fill_in(:name, with: 'Kenneth Barrett')
  fill_in(:username, with: 'kennbarr')
  fill_in(:email, with: 'ken@ken.com')
  fill_in(:password, with: 'secret')
  fill_in(:password_confirmation, with: 'secret')
  click_button 'sign up'
end

def sign_up_unmatched_passwords
  visit '/'
  click_button 'sign up'
  fill_in(:name, with: 'Kenneth Barrett')
  fill_in(:username, with: 'kennbarr')
  fill_in(:email, with: 'ken@ken.com')
  fill_in(:password, with: 'secret')
  fill_in(:password_confirmation, with: 'schmecret')
  click_button 'sign up'
end

def log_in
  visit '/'
  fill_in(:username, with: 'kennbarr')
  fill_in(:password, with: 'secret')
  click_button 'log in'
end

def log_in_wrong_username
  visit '/'
  fill_in(:username, with: 'kbarr')
  fill_in(:password, with: 'secret')
  click_button 'log in'
end

def log_in_wrong_password
  visit '/'
  fill_in(:username, with: 'kennbarr')
  fill_in(:password, with: 'schmecret')
  click_button 'log in'
end

def create_user
  User.create(name: 'Kenneth Barrett',
              username: 'kennbarr',
              email: 'ken@ken.com',
              password: 'secret',
              password_confirmation: 'secret')
end
