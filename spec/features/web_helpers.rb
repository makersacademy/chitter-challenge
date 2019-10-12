def sign_up
  fill_in('user_name', with: 'J')
  fill_in('name', with: 'John')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign up')
end

def sign_in_correct
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  click_button('Sign in')
end

def sign_in_incorrect
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'ciao')
  click_button('Sign in')
end
