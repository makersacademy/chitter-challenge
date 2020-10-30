def sign_up
  click_link('Sign up')
  fill_in('email', with: 'yourname@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'John Doe')
  fill_in('username', with: 'jdoe1982')
  click_button('Sign up')
end

def sign_in
  User.create(email: 'ralph.mallett@example.com', password: 'passw0rd', name: 'Ralph', username: 'ralphm10')
  visit '/peeps'
  click_link('Sign in')
  fill_in('email', with: 'ralph.mallett@example.com')
  fill_in('password', with: 'passw0rd')
  click_button('Submit')
end
