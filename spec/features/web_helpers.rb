def sign_up_and_sign_in_as_richie
  User.add('richieganney', 'richieganney@icloud.com', 'Password123')
  visit('/sessions/new')
  fill_in 'email', with: 'richieganney@icloud.com'
  fill_in 'password', with: 'Password123'
  click_button("Sign in")
end

def sign_up_as_test
  visit('/users')
  fill_in 'username', with: 'test'
  fill_in 'email', with: 'test@test.com'
  fill_in 'password', with: 'Password123'
  click_button("Sign up!")
end

def sign_up_and_sign_in_as_test
  # Create the user
  User.add('testy_boi', 'test@example.com', 'password123')
  # Sign in as that user
  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end