# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: users

Columns:
id | name | username | email | password 
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_users.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users ("name", "username", "email", "password") VALUES
('Jane Hopper', 'Biokinesis', 'eleven@strangerthings.com', 'IloveMike11'),
('Mike Wheeler', 'D&D', 'mike@strangerthings.com', 'IloveEl'),
('Dustin Henderson', 'Demogorgan', 'dustin@strangerthings.com', 'DArtagnan'),
('Will Byers', 'MindFlayer', 'will@strangerthings.com', 'Tunne1s'),
('Steve Harrington', 'BaseballBat', 'steve@strangerthings.com', 'Nancy123'),
( 'Erica Sinclair', 'Boffin', 'erica@strangerthings.com)', 'LucasisStupid!');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
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
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :username, :email, :password
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
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  def find(email)
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users WHERE id = $1;

    # if email exists, return nil
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(username)
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users WHERE username = $1;

    # Returns nil if username exists
  end

  # Add more methods below for each operation you'd like to implement.

  def create(user)
    # Executes SQL query:
    # INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4)

    # return user
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# is email in use

repo = UserRepository.new
found_user = repo.find('mike@strangerthings.com')

if found_user.nil?
  else
expect(found_user.name).to eq 'Mike Wheeler'
expect(found_user.username).to eq 'D&D'
expect(found_user.email).to eq 'mike@strangerthings.com'

# 2
# Get a single user

repo = UserRepository.new
user = repo.find(username)

if found_username.nil?
else

expect(found_username.id).to eq 1
expect(found_username.name).to eq 'Jane Hopper'
expect(found_username.username).to eq 'Biokinesis'
expect(found_username.email).to eq 'eleven@strangerthings.com'


# Add more examples for each method

# 3
# creates a new user

repo = UserRepository.new
new_user = User.new

new_user.name = 'Max Mayfield'
new_user.username = 'MadMax'
new_user.email = 'max@strangerthings.com'
new_user.password = 'KateBush1'

repo.create(new_user)

# 4 
# creates a new user when the find method is called
repo = UserRepository.new
new_user = User.new
    
new_user.name = 'Max Mayfield'
new_user.username = 'MadMax'
new_user.email = 'max@strangerthings.com'
new_user.password = 'KateBush1'

epo.create(new_user)
found_user = repo.find('max@strangerthings.com')
        
expect(found_user.id).to eq 7
expect(found_user.name).to eq 'Max Mayfield'
expect(found_user.username).to eq 'MadMax'
expect(found_user.email).to eq 'max@strangerthings.com'
expect(found_user.password).to eq 'KateBush1'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
  connection.exec(seed_sql)
end

describe UsertRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---



<!-- END GENERATED SECTION DO NOT EDIT -->