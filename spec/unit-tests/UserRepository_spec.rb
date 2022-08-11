# 1
# Get all users

repo = UsersRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].username # =>  'David'
users[0].email # =>  330
users[0].password #=> 4

users[1].id # =>  2
users[1].username # =>  'Anna'
users[1].email # =>  330
users[1].password #=> 5

# 2
# Get a single user

repo = UsersRepository.new

users = repo.find(1)

users.id # =>  1
users.username # =>  'David'
users.email # =>  "23"
users.password # =>  "3"

# 3
# create a single order 
repo = UsersRepository.new
user = user.new
user.id # => "??"
user.username # =>  'rings_new'
user.email # =>  34
user.password # =>  6

repo.create(user)
users = repo.all


users[2].id # => "3"
users[2].username # =>  'rings_new'
users[2].email # =>  34
users[2].password # =>  6

#4
# update an user
repo = UsersRepository.new
user = repo.find(1)

user.username # =>  'rubies_new'
repo.update(user)

users = repo.all


users[2].id # => "1"
users[2].username # =>  'rubies_new'
users[2].email # => 800
users[2].password # => 19

#5
# delete an user
repo = UsersRepository.new
user = repo.find(1)

repo.delete(user)

users = repo.all
users.length #=> 1