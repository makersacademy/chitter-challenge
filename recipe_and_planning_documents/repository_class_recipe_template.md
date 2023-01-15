# Users and Peeps Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | name | cohort_name
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

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, password, first_name, last_name, email, logged_in) VALUES ('jsmith', 'testpassword1', 'John', 'Smith', 'john.smith@email.co.uk', 'yes');
INSERT INTO users (username, password, first_name, last_name, email, logged_in) VALUES ('ajones', 'testpassword2', 'Alice', 'Jones', 'alice.jones@email.co.uk', 'yes');
INSERT INTO users (username, password, first_name, last_name, email, logged_in) VALUES ('fmcgregor', 'testpassword3', 'Freddie', 'McGregor', 'freddie.mcgregor@email.co.uk', 'yes');
INSERT INTO users (username, password, first_name, last_name, email, logged_in) VALUES ('pmannings', 'testpassword4', 'Paul', 'Mannings', 'paul.mannings@email.co.uk', 'yes');

INSERT INTO peeps (content, time, user_id) VALUES ('Test peep content 1', '2022-01-08 04:05:06', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Test peep content 2', '2022-01-09 10:10:10', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Test peep content 3', '2022-02-09 12:12:12', '2');
INSERT INTO peeps (content, time, user_id) VALUES ('Test peep content 4', '2022-03-09 13:13:13', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('Test peep content 5', '2022-04-09 14:14:14', '4');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
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

# Table name: peeps

# Model class
# (in lib/user.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :user_id
end

# Table name: users

# Model class
# (in lib/user.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :username, :password, :first_name, :last_name, :email, :logged_in
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
    # SELECT id, username, password, first_name, last_name, email, logged_in FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(user_id)
    # Executes the SQL query:
    # SELECT id, username, password, first_name, last_name, email, logged_in FROM users WHERE id = $1;

    # Returns a single User object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (username, password, first_name, last_name, email, logged_in)
    # VALUES ($1, $2, $3, $4, $5, $6);

    # returns nil
  end

  def update(user)
    # Executes the SQL query:
    # UPDATE users SET username = $1, password = $2, first_name = $3, last_name = $4, email = $5, logged_in = $6 WHERE id = $7;

    # Returns nothing
  end

  def delete(user_id)
    # Executes the SQL query:
    # DELETE FROM users WHERE user_id = $1;

    # Returns nothing
  end
end

# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(peep_id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, time, user_id)
    # VALUES ($1, $2, $3);

    # returns nil
  end

  def update(peep)
    # Executes the SQL query:
    # UPDATE peeps SET content = $1, time = $2, user_id = $3 WHERE id = $4;

    # Returns nothing
  end

  def delete(peep_id)
    # Executes the SQL query:
    # DELETE FROM peeps WHERE peep_id = $1;

    # Returns nothing
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# User Repository Class
# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  4

users[0].id # =>  1
users[0].username # =>  'jsmith'
users[0].password # =>  'testpassword1'
users[0].first_name # =>  'John'
users[0].last_name # =>  'Smith'
users[0].email # =>  'john.smith@email.co.uk'
users[0].logged_in # =>  'yes'

users[1].id # =>  2
users[1].username # =>  'ajones'
users[1].password # =>  'testpassword2'
users[1].first_name # =>  'Alice'
users[1].last_name # =>  'Jones'
users[1].email # =>  'alice.jones@email.co.uk'
users[1].logged_in # =>  'yes'

# 2
# Get a single user

repo = UserRepository.new

users = repo.find(1)

users.id # =>  1
users.username # =>  'jsmith'
users.password # =>  'testpassword1'
users.first_name # =>  'John'
users.last_name # =>  'Smith'
users.email # =>  'john.smith@email.co.uk'
users.logged_in # =>  'yes'

# 3
# Get a single other user

repo = UserRepository.new

users = repo.find(2)

users.id # =>  2
users.username # =>  'ajones'
users.password # =>  'testpassword2'
users.first_name # =>  'Alice'
users.last_name # =>  'Jones'
users.email # =>  'alice.jones@email.co.uk'
users.logged_in # =>  'yes'

# 4
# Create a user entry

repo = UserRepository.new

user = User.new

users.username = 'kimboslice'
users.password = 'testpassword5'
users.first_name = 'Kimbo'
users.last_name = 'Slice'
users.email = 'kimbo.slice@email.co.uk'
users.logged_in = 'no'

repo.create(user)

users = repo.all
last_user = users.last
last_user.username #=> 'kimboslice'
last_user.password #=> 'testpassword5'
last_user.first_name #=> 'Kimbo'
last_user.last_name #=> 'Slice'
last_user.email #=> 'kimbo.slice@email.co.uk'
last_user.logged_in #=> 'no'

# 4 
# Update a user

repo = UserRepository.new

user = repo.find(2)
user.username = 'ajones'
user.password = 'newtestpassword'


repo.update(user)

updated_user = repo.find(2)

updated_user.id # =>  2
updated_user.username # =>  'ajones'
updated_user.password # =>  'newtestpassword'
updated_user.first_name # =>  'Alice'
updated_user.last_name # =>  'Jones'
updated_user.email # =>  'alice.jones@email.co.uk'
updated_user.logged_in # =>  'yes'

# 5
# Delete a user

repo = UserRepository.new

delete_user = repo.delete('2')
users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].username # =>  'jsmith'
users[0].password # =>  'testpassword1'
users[0].first_name # =>  'John'
users[0].last_name # =>  'Smith'
users[0].email # =>  'john.smith@email.co.uk'
users[0].logged_in # =>  'yes'

# Peep Repository Class
# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  4

peeps[0].id # =>  1
peeps[0].content # =>  'Test peep content 1'
peeps[0].time # =>  '2022-01-08 04:05:06'
peeps[0].user_id # =>  '1'

peeps[1].id # =>  2
peeps[1].content # =>  'Test peep content 2'
peeps[1].time # =>  '2022-01-09 10:10:10'
peeps[1].user_id # =>  '1'

peeps[1].id # =>  5
peeps[1].content # =>  'Test peep content 5'
peeps[1].time # =>  '2022-03-09 13:13:13'
peeps[1].user_id # =>  '4'

# 2
# Get a single peep

repo = PeepRepository.new

peeps = repo.find(1)

peeps.id # =>  1
peeps.content # =>  'Test peep content 1'
peeps.time # =>  '2022-01-08 04:05:06'
peeps.user_id # =>  '1'

# 3
# Get a single other peep

repo = PeepRepository.new

peeps = repo.find(4)

peeps.id # =>  4
peeps.content # =>  'Test peep content 4'
peeps.time # =>  '2022-03-09 13:13:13'
peeps.user_id # =>  '3'

# 4
# Create a peep entry

repo = PeepRepository.new

peep = Peep.new

peeps.content = 'New test peep content'
peeps.time = '2022-06-10 17:14:10'
peeps.user_id = '3'

repo.create(peep)

peeps = repo.all
last_peep = peeps.last

last_peep.id #=> '6'
last_peep.content #=> 'New test peep content'
last_peep.time #=> '2022-06-10 17:14:10'
peeps.user_id #=> '3'

# 4 
# Update a peep

repo = PeepRepository.new

peep = repo.find(2)
peep.content = 'Updated peep test content'

repo.update(peep)

updated_peep = repo.find(2)

updated_peep.id # =>  2
updated_peep.content # => 'Updated peep test content'
updated_peep.time # => '2022-01-09 10:10:10'
updated_peep.user_id # => '1'

# 5
# Delete a peep

repo = PeepRepository.new

delete_peep = repo.delete('2')
peeps = repo.all

peeps.length # =>  4

peeps[0].id # =>  1
peeps[0].content # =>  'Test peep content 1'
peeps[0].time # =>  '2022-01-08 04:05:06'
peeps[0].user_id # =>  '1'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peep_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
