
# Users Model and Repository Classes Design

## 1. Table Design 

```
Table: users

Columns:
id | content | timestamp | user_id
```

## 2. Test SQL seeds

```sql
TRUNCATE TABLE users RESTART IDENTITY; -- 

INSERT INTO users (username, email_address, signup_date ) VALUES ('Hey, checking this site out', 23-01-01, 1);
INSERT INTO users (username, email_address, signup_date ) VALUES ('Hey, checking this site out', 23-01-01, 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Classes

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

## 4. Model class

```ruby

# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :username, :email_address, :registration_date
end

# user = User.new
# user.name = 
# user.name
```

## 5. Repository Class interface

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    
    #SELECT id, username, email_address, registration_date FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  
  # Gets a single record by its username
  # One argument: the username(string)
  def find(arg)
    # Executes the SQL query:
    # SELECT id, username, email_address, registration_date FROM users WHERE id = $1 OR username = $1;

    # Returns matching User objects.
  end
  
  def create(user)
  # Executes the SQL query:
  # INSERT INTO users VALUES (username, email_address, registration_date);

  # creates a new user record
  end

  
end
```

## 6. Test Examples

These examples will later be encoded as RSpec tests.

```ruby

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  10

users[0].id # =>  1
users[0].username # =>  'alice'
users[0].email_address # =>  'alice@email.com'
users[0].registration_date # => 23-01-05

users[1].id # =>  2
users[1].username # =>  'bob'
users[1].email_address # =>  'bob@email.com'
users[0].registration_date # => 23-01-04

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.username # =>  'alice'
user.email_address # =>  'alice@email.com'
user.registration_date # => 23-01-05

# 3
# Get a single user by searching username

repo = UserRepository.new

user = repo.find('alice')

user.id # =>  1
user.username # =>  'alice'
user.email_address # =>  'alice@email.com'
user.registration_date # => 23-01-05


# 4
# Creates a new user

repo = UserRepository.new

user = repo.create('carol')

user.id # =>  3
user.username # =>  'carol'
user.email_address # =>  'carol@email.com'
user.registration_date # => time.now


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'users' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # Tests
end
```

## 8. Test-drive and implement the Repository class behaviour

_Refer to the repository class implementation for the users table and the repository and implementation spec files for tests_

