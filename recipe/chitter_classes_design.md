# CHITTER Model and Repository Classes Design Recipe


## 1. Design and create the Table

Refer to ./chitter_tables_design.md

## 2. Create Test SQL seeds

Refer to ./chitter_tables_design.md

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end
```
## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

# Model class
# (in lib/user.rb)
class User
  attr_accessor :id, :name, :email, :password
end

# Model class
# (in lib/peep.rb)
class Peep
  attr_accessor :id, :content, :time
end


```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)
class UserRepository

  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, email, password FROM users;
    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, email, password FROM users WHERE id = $1;
    # Returns a single user object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, password) VALUES ($1, $2, $3);
    # Returns nil
  end

  # def update(user)
  # end

  # def delete(user)
  # end
end

# Table name: users

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository

  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;
    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE id = $1;
    # Returns a single Peep object.
  end

  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);
    # Returns nil
  end

  # def update(user)
  # end

  # def delete(user)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# USER REPOSITORY TEST

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].name # =>  'Anna'
users[0].email # =>  'anna@hotmail.com'
users[0].password # =>  '235346hgsdv'

users[1].id # =>  2
users[1].name # =>  'John'
users[1].email # =>  'john123@gmail.com'
users[1].password # =>  'ddff!@£!@$34tfsd'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

users[1].id # =>  2
users[1].name # =>  'John'
users[1].email # =>  'john123@gmail.com'
users[1].password # =>  'ddff!@£!@$34tfsd'

# 3
# Get a single user: fails if the user is not on the list

repo = UserRepository.new
repo.find(10) # =>  fails with "No record found"


# 4
# Create a single user

repo = UserRepository.new
new_user = User.new
new_user.name # =>  'Joanna'
new_user.email # =>  'joannaMccain@gmail.com'
new_user.password # =>  'er4gg@$34tfsd'
repo.create(new_user)
added_user = repo.all.find[-1]
added_user.id # =>  4
added_user.name # =>  'Jonaan'
added_user.email # =>  'joannaMccain@gmail.com'
added_user.password # =>  'er4gg@$34tfsd'

# 4
# Create a single user: fails if name provided is incorrect

repo = UserRepository.new
new_user = User.new
new_user.name # =>  'Jonaan! pc,7^'
new_user.email # =>  'joannaMccain@gmail.com'
new_user.password # =>  'er4gg@$34tfsd'
repo.create(new_user) # => fails with 'Please review your name: no numbers or special letters allowed.'

# 4
# Create a single user: fails if email provided is incorrect

repo = UserRepository.new
new_user = User.new
new_user.name # =>  'Joanna'
new_user.email # =>  'joanna Mccaingmail.!<com'
new_user.password # =>  'er4gg@$34tfsd'
repo.create(new_user) # => fails with 'Your email is incorrect'

# 4
# Create a single user: fails if password provided is incorrect

repo = UserRepository.new
new_user = User.new
new_user.name # =>  'Joanna'
new_user.email # =>  'joannaMccain@gmail.com'
new_user.password # =>  'v' 
repo.create(new_user) # => fails with 'The password should be longer than 7 characters'


# PEEP REPOSITORY TESTS

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  6

peeps[0].id # =>  1
peeps[0].content # =>  'I love sunshine'
peeps[0].time # =>  '10:23'
peeps[0].user_id # =>  1

peeps[4].id # =>  5
peeps[4].content # =>  'I like dogs'
peeps[4].time # =>  '10:15'
peeps[4].user_id # =>  2

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peeps[1].id # =>  2
peeps[1].content # =>  'I do not love sunshine'
peeps[1].time # =>  '12:23'
peeps[1].user_id # =>  2

# 3
# Get a single user: fails if the user is not on the list

repo = PeepRepository.new
repo.find(10) # =>  fails with "No record found"

# 3
# Create a single peep

repo = PeepRepository.new
new_peep = peep.new
new_peep.content # =>  'a very new content'
new_peep.time # =>  '16.54'
new_peep.user_id # =>  2
added_peep = repo.all.find[-1]
added_peep.id # =>  7
added_peep.content # =>  'a very new content'
added_peep.time # =>  '16.54'
added_peep.user_id # =>  2
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/user_repository_spec.rb

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_table
  end

  # (your tests will go here).
end

# file: spec/peep_repository_spec.rb

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_chitter_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
