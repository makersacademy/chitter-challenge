def register_test
  visit '/users/new'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'testy mctestface')
  fill_in('username', with: 'test123')
  click_button 'Submit'
end

def create_test_user
  User.create(email: 'test@example.com', password: 'password123',
      name: 'testy mctestface', username: 'test123')
end
