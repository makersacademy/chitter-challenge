def sign_up
  visit('/')
  click_button('Sign up')
  fill_in('email', :with => 'test@example.com')
  fill_in('password', :with => 'password123')
  click_button('Submit')
end

def sign_in
  User.create(email: 'test@example.com', password: 'password123')
  visit('/')
  click_button('Sign in')
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def sign_in_with_wrong_email
  User.create(email: 'test@example.com', password: 'password123')
  visit('/')
  click_button('Sign in')
  fill_in(:email, with: 'wrongemail@mail.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def sign_in_with_wrong_password
  User.create(email: 'test@example.com', password: 'password123')
  visit('/')
  click_button('Sign in')
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'wrong password')
  click_button('Sign in')
end
