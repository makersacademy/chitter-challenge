# Peep Model and Repository Classes Design Recipe

## 1. Design and create the Table

Done.

## 2. Create Test SQL seeds

Done.

## 3. Define the class names

```ruby
class Peep
end

class PeepRepository
end
```

## 4. Implement the Model class

```ruby
class Peep
  attr_accessor :id, :content, :time_posted, :password, :user_id
end
```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, username, email, password FROM users;

    # Returns an array of User objects.
  end

  def create(new_user) # instance of User
    # Executes the SQL query:
    # INSERT INTO users (username, email, password) VALUES($1, $2, $3);

    # doesnt need to return anything
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find_by_email(email, submitted_password)
    # Executes the SQL query:
    # SELECT id, username, email, password FROM users WHERE email = $1 and password = $2;

    # Returns a single User object.
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

users.length # =>  3

users[0].id # =>  1
users[0].username # =>  'willj836'
users[0].email # =>  'willj836@gmail.com'

users[1].id # =>  2
users[1].username # =>  'OptimusPrime'
users[1].email # =>  'op123@hotmail.com'

# 2
# create a new user

repo = UserRepository.new

new_user = User.new
new_user.username = 'New User'
new_user.email = 'newuser@newuser.com'
new_user.password = 'new123'

repo.create(new_user)

repo.all.last.username # => 'New User'
repo.all.last.email # => 'newuser@newuser.com'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
def reset_tables
  seed_sql = File.read('spec/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._