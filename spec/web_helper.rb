def create_account(username, password)
  visit('/signup')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Sign up!')
end

<<<<<<< HEAD
def log_in(username, password)
  visit('/')
  click_button('Log in')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
=======
def log_in
  visit('/')
  click_button('Log in')
  fill_in(:username, with: 'chet')
  fill_in(:password, with: 'cutthechatterred2')
>>>>>>> 2d2b367b2fb71cd937686a9df489814059793285
  click_button('Log in')
end

def log_out
  visit('/')
  click_button('Log out')
end