def create_account
  visit '/'
  click_button('Create Account')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'password')
  fill_in('name', with: 'Matthew Bridges')
  fill_in('username', with: 'Indigo')
  click_button 'Submit'
end
