# Users Model and Repository Classes Design Recipe

## 1. Design and create the Table

```
Table: users

Columns:
id | username | name | email | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (username, name, email, password) values('joebloggs123', 'Joe Bloggs', 'joebloggs@gmail.com', 'myweakpassword');
INSERT INTO users (username, name, email, password) values('johnsmith2000', 'John Smith', 'john.smith@gmail.com', '123456');
INSERT INTO users (username, name, email, password) values('chitter_guy', 'Dave Jones', 'dave.jones@gmail.com', 'mypass123');

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_users.sql
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
# (in lib/user_repository.rb)
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
  attr_accessor :id, :username, :name, :email, :password
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
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
  # Select all users
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT username, name FROM users;

    # Returns an array of User objects.
  end

  # Insert a new user
  # One argument
  def create(user) # a user object
    # Executes the SQL query:
    # INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);

    # Returns nothing
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# 1
# Get all users
repo = UserRepository.new
users = repo.all

users.length # => 3

#2
# Get the first user
repo = UserRepository.new
users = repo.all

users.first.username # => "joebloggs123"
users.first.name # => "Joe Bloggs"
users.first.email # => "joebloggs@gmail.com"
users.first.password # => "myweakpassword"


# 3
# Create a new user and check how many
repo = UserRepository.new

user = User.new
user.username = "Sally Brown"
user.name = "Sally Brown"
user.email = "sally.brown@gmail.com"
user.password = "abc123abc123"
repo.create(user)

all_users = repo.all
all_users.length # => 4

# 4
# Create a new user and check the last insert
repo = UserRepository.new

user = User.new
user.username = "gemmawhite99"
user.name = "Gemma White"
user.email = "gemma.white@gmail.com"
user.password = "xyz987xyz987"
repo.create(user)

all_users = repo.all
all_users.last.username # => "gemmawhite99"
all_users.last.name # => "Gemma White"
all_users.last.email # => "gemma.white@gmail.com"
all_users.last.password # => "xyz987xyz987"
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_users.sql')
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