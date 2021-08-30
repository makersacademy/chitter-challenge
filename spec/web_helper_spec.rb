def sign_up
  visit '/users/new'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'test_password')
  fill_in('name', with: 'testname')
  fill_in('username', with: 'test_username')
  click_button('Sign up')
end

def sign_in
  User.create(email: 'test@test.com', password: 'password123', name: 'testname', username: 'username')
  visit '/peeps'
  click_button('Login')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password123')
  click_button('Sign in')
end

def sign_in_with_incorrect_email
  User.create(email: 'test@test.com', password: 'password123', name: 'testname', username: 'username')
  visit '/peeps'
  click_button('Login')
  fill_in('email', with: 'wrongemail@test.com')
  fill_in('password', with: 'password123')
  click_button('Sign in')
end

def sign_in_with_incorrect_password
  User.create(email: 'test@test.com', password: 'password123', name: 'testname', username: 'username')
  visit '/peeps'
  click_button('Login')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'wrongpassword')
  click_button('Sign in')
end