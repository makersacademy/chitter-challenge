def sign_up_erotic_dave
  visit '/'
  click_on 'New User Sign Up'
  name = 'Dave G. User'
  username = 'Erotic Dave'
  email = 'dave@googlemail.com'
  password = 'password'
  fill_in :fullname, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  click_on 'Register New User'
end

def sign_in_erotic_dave
  visit '/'
  click_on 'Existing User Sign In'
  fill_in :email, with: email
  fill_in :password, with: password
  click_on 'Sign In'
end

def sign_in_registered
  visit '/'
  click_on 'Existing User Sign In'
  fill_in :email, with: 'prevreg@gmail.com'
  fill_in :password, with: 'password'
  click_on 'Sign In'
end
