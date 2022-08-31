# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `users`*

```
# EXAMPLE

Table: users

Columns:
id | username | name | email | password
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

TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, name, email, password) VALUES 
('ted453', 'Ted D', 'tedd@hotmailtest.com', 'qwerty123'),
('jem341', 'Jemm Platz', 'JSpace@yahoot.com', 'astrocosmaus789'),
('user123', 'Anon Ymouse', 'is_a_user@user.com', 'password_123');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < chitter_test_seeds.sql
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
  attr_accessor :id, :username, :name, :email, :password
end

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
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns an array of user objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM users WHERE id = $1;

    # Returns a single user object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);
  end

  # def update(user)
  # end

  # def delete(user)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users

repo = userRepository.new
users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].username # => 'ted453'
users[0].name # =>  'Ted D'
users[0].email # =>  'tedd@hotmailtest.com'
users[0].password # => 'qwerty123'

users[1].id # =>  2
users[1].name # =>  'Anna'
users[1].email # =>  'May 2022'


# 2
# Get a single user

repo = userRepository.new

user = repo.find(1)

('ted453', 'Ted D', 'tedd@hotmailtest.com', 'qwerty123'),
('jem341', 'Jemm Platz', 'JSpace@yahoot.com', 'astrocosmaus789'),
('user123', 'Anon Ymouse', 'is_a_user@user.com', 'password_123');
user.id # =>  1
user.name # =>  'David'
user.cohort_name # =>  'April 2022'

# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'users' })
  connection.exec(seed_sql)
end

describe userRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
