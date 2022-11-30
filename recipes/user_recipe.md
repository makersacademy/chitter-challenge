{{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table
If the table is already created in the database, you can skip this step.

Tables is already created

## 2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES ('user1', 'username1', 'user1@fakeemail.com', 'fakepassword1');

INSERT INTO users (name, username, email, password) VALUES ('user2', 'username2', 'user2@fakeemail.com', 'fakepassword2');


-- Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.
```


## 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

## 4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :username, :email, :password
end


You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

## 5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.


# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users;

    # Returns an array of User objects.
  end
  def find(id)
    #execute SQL query:
    #SELECT id, name, username, email, password FROM users WHERE id = $1
  end
  def create(user)
    #execute SQL query:
    sql = 'INSERT INTO 
            users (name, username, email, password) 
            VALUES($1, $2, $3, $4);
  end
end

## 6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.
```ruby
# EXAMPLES

# 1
# Get all users

repo = UserRepository.new

users = repo.all
users.length # => 2
users.first.id # => '1'
users.first.name# => 'user1'
users.first.username # => 'username1'
users.first.email # => 'user1@fakemeail.com'
users.first.password # => 'fakepassword1'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.name # =>  'user1'
user.username # =>  'username1'
user.email # => 'user1@fakeemail.com'
user.password # => 'fakepassword1' 

# 2
# Get another single user

repo = UserRepository.new

user = repo.find(2)

user.id # =>  2
user.name # =>  'user2'
user.username # =>  'username2'
user.email # => 'user2@fakeemail.com'
user.password # => 'fakepassword2' 

#4 create a new item
repo = UserRepository.new

user = User.new
user.name = 'user3'
user.username = 'username3'
user.email = 'user3@fakeemail.com'
user.password = 'fakepassword3'

repo.create(user)

users = repo.all

users.length # => 3

last_user = users.last
last_user.name # => 'user3'
last_user.username # => 'username3'
last_user.email # => 'user3@fakeemail.com'
last_user.password # => 'fakepassword3'

# Add more examples for each method
Encode this example as a test.
```

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end

## 8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.