def sign_up(email = 'test@test.com',
            password = 'test123',
            password_confirmation = 'test123',
            name = 'John Smith',
            username = 'test_user1')
  visit '/signup'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'name', with: name
  fill_in 'username', with: username
  click_button 'Submit'
end

def login
  visit '/'
  fill_in 'username', with: 'test_user1'
  fill_in 'password', with: '123'
  click_button 'Login'
end