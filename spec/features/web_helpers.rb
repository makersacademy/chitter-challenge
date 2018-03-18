def create_test_account
  visit '/users/new'
  fill_in 'name', with: 'Mr Test'
  fill_in 'username', with: 'Tester'
  fill_in 'email', with: 'test@example.com'
  fill_in 'password', with: 'password123'
  click_button 'Submit'
end
