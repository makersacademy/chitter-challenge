def sign_in_with_test_user_1
  User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

  visit '/sessions/new'
  fill_in :email, with: 'test@example.com'
  fill_in :password, with: 'password123'
  click_button('Sign in')
end
