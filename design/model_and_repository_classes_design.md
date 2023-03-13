# Users Model and Repository Classes Design

1. Design and create tables 
(DONE)

2. Create test SQL seeds
(DONE)

3. 
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

4. 
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :name, :username, :email, :password
end

5. 
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Returning all user records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users;
    # Returns an array of User objects.
  end

  # Creating a new user record
  # Takes one argument
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (id, name, username, email, password) VALUES ('id', 'name', 'username', 'email', 'password');
    # Returns nothing.
  end
end

6. 

# 1 Get all users

repo = UserRepository.new

users = repo.all

expect(users.length).to eq(4)

expect(users[0].id).to eq(1)
expect(users[0].name).to eq('Konrad')
expect(users[0].username).to eq('kdun')
expect(users[0].email).to eq('konrad@gmail.com')
expect(users[0].password).to eq('konrad')

expect(users[3].id).to eq(4)
expect(users[3].name).to eq('Jellybean')
expect(users[3].username).to eq('jelly')
expect(users[3].email).to eq('jelly@hotmail.com')
expect(users[3].password).to eq('feedme')

# 2 Create a new user

# successfuly adding a user
repo = UserRepository.new
new_user = User.new

new_user.name = 'Joanna'
new_user.username = 'jojo'
new_user.email = 'joanna@pudelek.pl'
new_user.password = 'terminatorj12'

repo.create(new_user)

users = repo.all

expect(users.length).to eq(5)
expect(users.last.name).to eq('Joanna')
expect(users.last.username).to eq('jojo')
expect(users.last.name).to eq('joanna@pudelek.pl')
expect(users.last.name).to eq('terminatorj12')

# failing at adding a user (same username)
repo = UserRepository.new
new_user = User.new

new_user.name = 'Jonjo'
new_user.username = 'kdun'
new_user.email = 'joanna@pudelek.pl'
new_user.password = 'terminatorj12'

repo.create(new_user)

users = repo.all

expect(users.length).to eq(4)

# failing at adding a user (same email)
repo = UserRepository.new
new_user = User.new

new_user.name = 'Jonjo'
new_user.username = 'Jdawg'
new_user.email = 'lalka@onlygoblins.com'
new_user.password = 'badandboujie'

repo.create(new_user)

users = repo.all

expect(users.length).to eq(4)


# ---------------------------------------------

# Peeps Model and Repository Classes Design

1. 
(DONE)

2. 
(DONE)

3. 
# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end

4. 
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :content, :peep_time, :likes, :user_id
end

5. 
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Returning all peep records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, peep_time, likes, user_id FROM peeps;
    # Returns an array of Peep objects.
  end

  # Creating a new peep record
  # Takes one argument
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (id, content, peep_time, likes, user_id) VALUES ('id', 'content', 'peep_time', 'likes', 'user_id');
    # Returns nothing.
  end
end

6. 

# Returns all peeps

repo = PeepRepository.new
peeps = repo.all

expect(peeps.length).to eq(9)

expect(peeps[0].id).to eq(1)
expect(peeps[0].content).to eq('First peep')
expect(peeps[0].peep_time).to eq('2022-03-01 09:02:39')
expect(peeps[0].likes).to eq(4)
expect(peeps[0].user_id).to eq(1)

expect(peeps[7].id).to eq(8)
expect(peeps[7].content).to eq('Second peep')
expect(peeps[7].peep_time).to eq('2023-02-12 07:02:12')
expect(peeps[7].likes).to eq(7)
expect(peeps[7].user_id).to eq(4)

# Creates a new peep

repo = PeepRepository.new
new_peep = Peep.new

new_peep.content = 'Another peep'
new_peep.peep_time = '2023-03-06 10:52:12'
new_peep.likes = '0'
new_peep.user_id = '3'

repo.create(new_peep)

peeps = repo.all

expect(peeps.length).to eq(10)
expect(peeps.last.id).to eq(10)
expect(peeps.last.content).to eq('Another peep')
expect(peeps.last.peep_time).to eq('2023-03-06 10:52:12')
expect(peeps.last.likes).to eq(0)
expect(peeps.last.user_id).to eq(3)
