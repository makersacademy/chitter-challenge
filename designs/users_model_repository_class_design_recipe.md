# User - Model and Repository Classes Design Recipe

## 1. Design and create the Table

See: chitter_database_design_recipe.md

## 2. Create Test SQL seeds

See: ../spec/seeds_chitter.sql

## 3. Define the class names

```
┌────────────────────────────────────┐
│ UserRepository                     |
|                                    │
│ - all                              |
|   => 'returns all users' info'     │
│ - find(id)                         |
|   => 'returns a sinle user's info' │
| - find_by_username(username)       |
|   => 'returns a sinle user's info' │
│ - create(id, col, val)             │
│ - delete(username)                 │
└───────────┬────────────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ User                    │
│                         │
│ - id                    │
│ - name                  │
│ - username              │
│ - email                 |
└─────────────────────────┘
```

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
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User

  attr_accessor :id, :name, :username, :email
end
```

## 5. Define the Repository Class interface

```ruby
# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, username, email FROM users WHERE id = $1;

    # Returns a single User object.
  end

  # Gets a single record by its username
  # One argument: the username
  def find_by_username(username)
    # Executes the SQL query:
    # SELECT id, name, username, email FROM users WHERE username = $1;

    # Returns a single User object.
  end

  # Adds new record to the 'users' table
  # One argument: the new users
  def create(new_user)
    # Executes the SQL query:
    # INSERT INTO users (name, username, email) VALUES ($1, $2, $3);

    # Doesn't return anything
  end

  # Updates the 'users' table
  # 3 arguments: id, column name, value
  def update(id, col, val)
    # Executes the SQL query:
    # UPDATE users SET username = $3 WHERE id = $1;

    # Doesn't return anything
  end

  # Removes a record from the 'users' table
  # One argument: the username
  def delete(username)
    # Executes the SQL query:
    # DELETE FROM users WHERE username = $1;

    # Doesn't return anything
  end
end
```

## 6. Write Test Examples

```ruby
# EXAMPLES

# 1
# Get all users
repo = UserRepository.new

users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].name # =>  'name 1'
users[0].username # =>  'username_1'
users[0].email # =>  'test1@email.com'

users[1].id # =>  2
users[1].name # =>  'name 2'
users[1].username # =>  'username_2'
users[1].email # =>  'test2@email.com'

users[2].id # =>  3
users[2].name # =>  'name 3'
users[2].username # =>  'username_3'
users[2].email # =>  'test3@email.com'

# 2
# Get a single user by id
repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.name # =>  'name 1'
user.username # =>  'username_1'
user.email # =>  'test1@email.com'

# 3
# Adds new record to the 'users' table
  repo = UserRepository.new

  new_user = User.new
  new_user.name = 'Marie'
  new_user.username = 'ma_rie'
  new_user.email = 'test4@email.com'
  repo.create(new_user)

  users = repo.all

  users.length # =>  4
  users.last.username # =>  'ma_rie'
  users.last.email # =>  'test4@email.com'


# 4
# Get a single user by username
repo = UserRepository.new

user = repo.find_by_username('username_2')

users[1].id # =>  2
users[1].name # =>  'name 2'
users[1].username # =>  'username_2'
users[1].email # =>  'test2@email.com'

# 5
# updates a username' 
repo = UserRepository.new
repo.update(2, 'username', 'del_m')

users = repo.all
users[1].id # =>  '2'
users[1].name # =>  'name3'
users[1].username # =>  'Del_m'
users[1].email # =>  'test3@email.com'


# 6
# 'deletes an user' do
repo = UserRepository.new

repo.delete(1)
users = repo.all

users.length # =>  11
users.first.id # =>  2

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_directory_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._