def create_account
  visit('/')
  click_button('Create Account')
  fill_in('username', with: 'username')
  fill_in('password', with: 'password')
  fill_in('age', with: '100')
  click_button('Submit')
end

def sign_in
  visit('/')
  fill_in('username', with: 'username')
  fill_in('password', with: 'password')
  click_button('Sign In')
end
