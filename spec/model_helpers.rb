def create_test_user
  User.create(
    name: 'Test User',
    username: 'tester',
    email: 'test@makersacademy.com', 
    password: 'password123'
  )
end
