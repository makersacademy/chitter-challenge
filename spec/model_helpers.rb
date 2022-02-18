def create_test_user
  User.create(
    email: 'test@example.com', 
    password: 'password123', 
    user_name: 'testusername', 
    name: 'Test User'
  )
end