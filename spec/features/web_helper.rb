def sign_up
  visit('/sign_up')
  fill_in('name', with: 'Alaan')
  fill_in('username', with: 'Alaanzr')
  fill_in('email', with: 'Alaanzr@gmail.com')
  fill_in('password', with: 'password')
  click_button('Register')
end

def partial_sign_up
  fill_in('name', with: 'Alaan')
  click_button('Register')
end

def sign_in(name, username, email, password)
  visit('/')
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('Sign in')
end
