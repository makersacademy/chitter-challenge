# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | name | email_address | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email_address, password) VALUES ('David', 'email_1@yahoo.co.uk', '##^%$&^$#');
INSERT INTO users (name, email_address, password) VALUES ('Anna', 'email_2@gmail.com', '#%%&^%££###');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class User
end

# Repository class
# (in lib/student_repository.rb)
class UserRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :email_address, :password
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
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
 def all
    users = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, name, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      user = User.new
      user.id = record['id']
      user.title = record['name']
      user.release_year = record['email_address']
      user.artist_id = record['password']

      users << user
    end

    return users
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(email_address)
    sql = 'SELECT id, name, email_address, password FROM users WHERE email_address = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email_address])

     user = User.new
     user.id = result_set[0]['id']
     user.name = result_set[0]['name']
     user.email_address = result_set[0]['email_address']
     user.password = result_set[0]['password']

    return user
  end

  # create a new user
  def create(user)
    sql = 'INSERT INTO users (name, email_address, password) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.email_address, user.password])

    return user
  end

  # def update(student)
  # end

  # def delete(student)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all students

repo = UserRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].name # =>  'David'
users[0].email_address # =>  'email_1@yahoo.co.uk'
users[0].password # => '##^%$&^$#'

users[1].id # =>  2
users[1].name # =>  'Anna'
users[1].email_address # =>  'email_2@gmail.com'
users[1].password # => '#%%&^%££###'

# 2
# Get a single student

repo = UserRepository.new

user = repo.find('email_1@yahoo.co.uk')

user.id # =>  1
user.name # =>  'David'
user.email_address # =>  'email_1@yahoo.co.uk'
user.password # => '##^%$&^$#'

# 3
# Create new user

repo = UserRepository.new

user = User.new
user.name = 'Eric'
user.email_address = 'new_address@aol.com'
user.password = 'new password'

repo.create(user)

users = repo.all

users.last.id # => '3'
users.last.name # => 'Eric'
users.last.email_address # => 'new_address@aol.com'
users.last.password # => 'new password'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
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
