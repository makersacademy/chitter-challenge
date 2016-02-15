def create_account(name, email, username, password)
  visit('/signup')
  fill_in(:name, with: name)
  fill_in(:email, with: email)
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Sign up')
end

def log_in(username, password)
  visit('/')
  click_button('Log in')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Log in')
end

def log_out
  visit('/')
  click_button('Log out')
end