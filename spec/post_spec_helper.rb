require 'pry'

def create_post
  User.create(
    user_name: 'Peter',
    email: 'peter_test@test.com',
    password: 'peter12345'
  )

  Post.create(
    user_id: '1',
    message: 'Hello!'
  )
end

def create_posts
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
  Post.create(
    user_id: '1',
    message: 'Hello!'
  )
  Post.create(
    user_id: '1',
    message: 'I am fine!'
  )
  Post.create(
    user_id: '2',
    message: 'Today is a good day!'
  )
end
