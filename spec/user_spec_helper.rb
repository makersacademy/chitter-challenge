require 'pry'

def create_user
  User.create(
    user_name: 'Peter',
    email: 'peter_test@test.com',
    password: 'peter12345'
  )
end

def create_users
  User.create(
    user_name: 'Peter',
    email: 'peter_test@test.com',
    password: 'peter12345'
  )
  User.create(
    user_name: 'Donna',
    email: 'donna_test@test.com',
    password: 'donna12345'
  )
end
