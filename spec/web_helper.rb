def create_account
  visit('/signup')
  fill_in(:username, with: 'Chet')
  fill_in(:password, with: 'cutthechatterred2')
  click_button('Sign up!')
end

def log_in
  visit('/')
  click_button('Log in')
  fill_in(:username, with: 'chet')
  fill_in(:password, with: 'cutthechatterred2')
  click_button('Log in')
end

def log_out
  visit('/')
  click_button('Log out')
end