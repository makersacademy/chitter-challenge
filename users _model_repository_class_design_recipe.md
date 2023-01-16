Users Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table users

```sql

# EXAMPLE

Table: users

Columns:
id | username | password | user_email
2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.



```
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < chitter.sql
psql -h 127.0.0.1 chitter_test < seeds_users.sql

``` 


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
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
4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.
```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/users.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :username, :password, :user_email
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# user = User.new
# user.username = 'Oana'
# user.user_email = 'oana@gmail.com'

```
You may choose to  test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.
```ruby
# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all users
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, username FROM users;

    # Returns an array of User objects.
  end

  # inserts a new user record
  # takes an User object as an argument
  def create(user)
    # executes the SQL query
    # INSERT INTO users (username, password, user_email) VALUES ($1, $2, $3);

    # dreturns the new user
  end

    # updates an user record
    #takes an User object as an argument
  def update(user)
    # executes the SQL query
    # UPDATE users SET username = $1, password = $2, user_email = $3 WHERE id = $4;
  end
end
```
6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES
```ruby
# 1
# Get all user objects

repo = UserRepository.new

users = repo.all

users.length # =>  4

users[0].id # =>  1
users[0].username # =>  'Roger'
users[0].user_email # =>  'roger@yahoo.com'


2
Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.username # =>  'Roger'
user.user_email # =>  'roger@yahoo.com'

# 3
# Creates a new user
repo = UserRepository.new
user = User.new
user.username = 'Alec'
user.password = 'keyboard'
user.user_email = 'alec@icloud.com'

repo.create(user)  #=> nil
users = repo.all
last_user = users.last
last_user.name # => 'Alec'
last_user.user_email # => 'alec@icloud.com'

# 4. Deletes an user  
# repo = UserRepository.new
# id_to_delete = 1
# repo.delete(id_to_delete)
# all_users = repo.all
# all_users.length #=> 1
# all_users.first.id #=> '2'

 # 5. Updates an user by value

 repo = UserRepository.new
 user = repo.find(1)
 user.username = 'Something else'
 user.user_email = 'Disco'

 repo.update(user)
 updated_user = repo.find(1)
 updated_user.username #=> 'RogerD'
 updated_user.user_email # => 'roger_d@yahoo.com'
 
# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.
```
# EXAMPLE

# file: spec/user_repository_spec.rb
```ruby
def reset_users_table
  seed_users_sql = File.read('spec/seeds_users.sql')
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
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

