# Users Model and Repository Classes Design Recipe

## 1. Design and create the Table

schema/peeps_users_tables.sql
```
Table: peeps

Columns:
id | content | datetime | user_id
```

## 2. Create Test SQL seeds

schema/peeps_users_seeds.sql

## 3. Define the class names


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
```

## 4. Implement the Model class

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :email, :password, :name, :username
end
```

## 5. Define the Repository Class interface

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class User Repository

  def initialize
  # instance variable (logged_in) with boolean value, default is false
  # instance variable (logged_in_user) no value default, will hold User object of logged in user
  end

  # Selecting all records
  # No arguments
  def all_users
    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns an array of user objects.
  end

  # Gets a single record by its ID
  # Two arguments: the email or username and the password
  def find_user(email_username, password)
    # Executes the SQL query:
    # SELECT * FROM users WHERE (email = $1 OR username = $1) AND password = $2;

    # Returns a single User object.
  end

  def create_user(user)
    # During sign up process user object attributes will be filled, and that object will be passed into here

    # First check if username or password are unique by calling all_users and iterating over username and password attributes. If exists return false

    # Executes the SQL query:
    # INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4)
    # return true if successful
  end

  # def edit_user(user)
      # user can edit info
  # end

  # def delete_user(user)
    #user can delete their account
  # end
end
```

## 6. Write Test Examples


```ruby

# 1
# Get all users

users = @repo.all_users

users.length # =>  4

users[0].id # =>  '1'
users[0].email # =>  'samuelbadru@outlook.com'
users[0].password # =>  'makersforlife'
users[0].name # => 'Samuel Badru'
users[0].username # => 'sobad'

users[1].id # =>  '2'
users[1].email # =>  'jermainecole@hotmail.com'
users[1].password # =>  'middlechild'
users[1].name # => 'Jermaine Cole'
users[1].username # => 'j.cole'

# 2
# get a single user
# uses correct email and password

user = @repo.find_user('aubreygraham@gmail.com', 'hotlinebling')

user.id # =>  '3'
user.email # => 'aubreygraham@gmail.com'
user.password # => 'hotlinebling'
user.name # =>  'Aubrey Graham'
user.username # =>  'drake'

# uses correct username and password
user = @repo.find_user('kendricklamar', 'goodkid')

user.id # =>  '4'
user.email # => 'kendrickduckworth@aol.com'
user.password # => 'goodkid'
user.name # =>  'Kendrick Duckworth'
user.username # =>  'kendricklamar'


# 3
# Create a user
# uses an available username and email
new_user = User.new
new_user.email # => 'santandave@icloud.com'
new_user.password # => 'psychodrama'
new_user.name # =>  'Santan Dave'
new_user.username # =>  'dave'

@repo.create_user(new_user) # => true
users = @repo.all_users
users[-1].email # => 'santandave@icloud.com'
users[-1].password # => 'psychodrama'
users[-1].name # =>  'Santan Dave'
users[-1].username # =>  'dave'

# uses unavailable username
new_user = User.new
new_user.email # => 'drakebell@icloud.com'
new_user.password # => 'drakeandjosh'
new_user.name # =>  'Drake Bell'
new_user.username # =>  'drake'

@repo.create_user # => false

# uses unavailable email
new_user = User.new
new_user.email # => 'samuelbadru@outlook.com'
new_user.password # => 'drakeandjosh'
new_user.name # =>  'Drake Bell'
new_user.username # =>  'drakejosh'

@repo.create_user # => false

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

```ruby

# file: spec/user_repository_spec.rb

def reset_peeps_users_tables
  seed_sql = File.read('spec/peeps_users_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before do 
    reset_peeps_users_tables
    @repo = UserRepository.new
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
