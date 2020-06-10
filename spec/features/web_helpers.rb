def make_peep(peep)
  visit('/')
  fill_in('peep', with: "#{peep}")
  click_button('Peep')
end

def sign_up(email = 'test@example.com', username = 'testusername', name = 'testname')
  visit '/'
  click_button('Sign Up')
  fill_in('email', with: email)
  fill_in('password', with: 'password123')
  fill_in('username', with: username)
  fill_in('name', with: name)
  click_button('Submit')
end

def sign_in(email, password)
  click_button('Sign in')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Log In')
end
