# Users Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_users_peeps.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('magpie@mail.com', 'magpie2023', 'Magpie', 'Mag Pie')
INSERT INTO users (email, password, name, username) VALUES ('mockingbird@mail.com', 'mockingbird2023', 'Mockingbird', 'Mocking Bird')
INSERT INTO users (email, password, name, username) VALUES ('nightingale@mail.com', 'nightingale2023', 'Nightingale', 'Night Ingale')

INSERT INTO peeps (content, date_time, user_id) VALUES ('Mag mag mag Pie', '2023-01-08 10:00:00', '1')
INSERT INTO peeps (content, date_time, user_id) VALUES ('Mock mock mock Ingbird', '2023-01-10 13:30:00', '2')
INSERT INTO peeps (content, date_time, user_id) VALUES ('Night night night Ingale', '2023-01-13 18:20:00', '3')

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter < seeds_users_peeps.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/User_repository.rb)
class UserRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :password, :name, :username
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

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM users;

    # Returns an array of User objects.
  end

  # Selects a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM users WHERE id = $1

    # Returns a single User object.
  end

  # Creates a new record
  # One argument: a new User Object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4)

    # Does not return a value
  end

  # Deletes a record
  # One argument: the id (number)
  def delete(id)
    # Executes the SQL query:
    # DELETE FROM users WHERE id = $1
    
    # Does not return a value
  end

end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # => 3

users[0].id # => 1
users[0].name # => 'Magpie'
users[0].username # => 'Mag Pie'

users[1].id # => 2
users[1].name # => 'Mockingbird'
users[1].username # => 'Mocking Bird'

users[2].id # => 3
users[2].name # => 'Nightingale'
users[2].username # => 'Night Ingale'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.name # => 'Magpie'
user.username # => 'Mag Pie'

# 3
# Creates a new user

repo = UserRepostitory.new

user = User.new
user.email = 'sparrow@mail.com'
user.password = 'sparrow2023'
user.name = 'Sparrow'
user.username = 'Spar Row'

repo.create(user)

all_users = repo.all # => expect all_users to contain the new user

# 4
# Deletes a user

repo = UserRepository.new

repo.delete(1)

all_users = repo.all # => expect all_users not to contain the deleted user

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

