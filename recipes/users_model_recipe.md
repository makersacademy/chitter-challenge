{{TABLE NAME}} Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.
1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: users

Columns:
id | email | password | name | username | logged_in

2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: seeds/seeds_users.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (email, password, name, username, logged_in) VALUES ('andy@gmail.com', 'password', 'Andy', 'Andy1', 0);
INSERT INTO students (email, password, name, username, logged_in) VALUES ('bob@gmail.com', 'betterpassword', 'Bob', 'Bob99', 0);


Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql

3. Define the class names


4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :password, :name, :uername, :logged_in
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name

You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.
5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository
  def all
    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns a single User object.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, username, logged_in FROM users WHERE id = $1;

    # Returns a single User object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email, password, name, username, logged_in) VALUES($1, $2, $3, $4, false);

  end

  def log_in(user)
    # Executes the SQL query:
    UPDATE users SET logged_in = true WHERE email == $1 && password == $2;
  end

  def log_out(id)
    # Executes the SQL query:
    UPDATE users SET logged_in = false WHERE id == $1;
  end
end

6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.email # =>  'Andy@gmail.com'
user.password # =>  'password'
user.name # => 'Andy'
user.username # => 'Andy1'
user.logged_in # => false

# 2
# log a user in and out with correct details

repo = UserRepository.new

user = User.new
user.email = 'andy@gmail.com'
user.password = 'password'

repo.log_in(user)
new_user = repo.find(1)
user.logged_in # => true

repo.log_out(1)
new_user = repo.find(1)
new_user.logged_in # => false

# 3
# log a user in with incorrect details

repo = UserRepository.new

user = User.new
user.email = 'andy@gmail.com'
user.password = 'passw0rd'

repo.log_in(user)

new_user = repo.find(1)
user.logged_in # => false

# 4
# return all users

repo = UserRepository.new

users = repo.all
users.first.id # => 1
users.first.email # => 'andy@gmail.com'
users.first.password # => 'password'
users.first.name # => 'Andy'
users.first.username # => 'Andy1'
users.first.logged_in # => false
users.length # => 2

# 5
# create a new user

repo = UserRepository.new

user = User.new
user.first.email ='jim@gmail.com'
user.first.password = 'password99'
user.first.name = 'Jim'
user.first.username = 'Jimbo'
user.first.logged_in = true

repo.create(user)

users = repo.all
users.last.id # => 3
users.last.email # => 'jim@gmail.com'
users.last.password # => 'password99'
users.last.name # => 'Jim'
users.last.username # => 'Jimbo'
users.last.logged_in # => false
users.length # => 3


# Add more examples for each method

Encode this example as a test.
7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.