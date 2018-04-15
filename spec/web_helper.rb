require 'pry'

def create_user
  User.create(
    user_name: 'Peter',
    email: 'peter_test@test.com',
    password: 'peter12345'
  )
end
