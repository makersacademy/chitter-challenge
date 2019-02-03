def register
  visit '/'
  click_button 'Register'
  fill_in 'name', with: 'user name'
  fill_in 'email', with: 'user1@gmail.com'
  fill_in 'username', with: 'user1'
  fill_in 'password', with: 'password123'
  click_button 'Register'
end

def sign_in
  visit '/'
  fill_in 'username', with: 'user1'
  fill_in 'password', with: 'password123'
  click_button 'Sign in'
end
