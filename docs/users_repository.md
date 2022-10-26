# Users Model and Repository Classes Design Recipe

## Class names

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

## The Model class

```ruby
# Table name: users

# Model class
# (in lib/users.rb)

class User
  att_accessor :id, :email, :password, :name, :username
end
```

## The Repository Class interface

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository
  
  # Create a User object from SQL record
  def user_from_record(record)
    # Returns a User object
  end
  
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns an array of User objects.
  end

  # Gets a single user by their ID
  # One argument: the id
  def find_by_id(id)
    # Executes the SQL query:
    # SELECT * FROM users WHERE id = $1;

    # Returns a single User object.
  end
  
  # Gets a single user by their email
  # One argument: the email
  def find_by_email(email)
    # Executes the SQL query:
    # SELECT * FROM users WHERE email = $1;
    
    # Returns a single User object
  end

  # Gets a single user by their username
  # One argument: username
  def find_by_username(username)
    # Executes the SQL query:
    # SELECT * FROM users WHERE username = $1;
    
    # Returns a single User object
  end

  # Creates a new user record in the database
  # One argument: user object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email, password, name, username)
    # VALUES ($1, $2, $3, $4)
    
    # Returns nothing
  end
end
```

## Reload the SQL seeds before each test run

```ruby
# file: spec/user_repository_spec.rb

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_development' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

end
```
