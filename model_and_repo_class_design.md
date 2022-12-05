# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
| Table                 | Columns          |
| --------------------- | ------------------  |
| makers                | id, name, username, email, password
| peeps                 | id, peep, time, maker_id

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

TRUNCATE TABLE peeps, makers RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO makers (name, username, email, password) VALUES ('name1', 'user1', 'name1@email.com', 'password1');
INSERT INTO makers (name, username, email, password) VALUES ('name2', 'user2', 'name2@email.com', 'password2');

INSERT INTO peeps (peep, time, maker_id) VALUES ('first peep', '2022-10-10 10:10:10', '1');
INSERT INTO peeps (peep, time, maker_id) VALUES ('second peep', '2022-20-20 20:20:20', '1');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_database_test < seeds_makers.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: makers

# Model class
# (in lib/maker.rb)
class Maker
end

# Repository class
# (in lib/maker_repository.rb)
class MakerRepository
end

# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peep.rb)
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
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

class Maker

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :username, :email, :password
end

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :peep, :time, :maker_id
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

class MakerRepository

  def all
    # Executes the SQL query:
    # SELECT id, name, username, email, password;

    # Returns an array of Maker objects.
  end

  def find(id)
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM makers WHERE id = $1;

    # Returns a single post object.
  end

  def create(user_account)
    # INSERT INTO Maker
    # (name, username, email, password)
    # VALUES (user_account.name, user_account.username, user_account.email, user_account.password);
    # returns nil
  end

end

class PeepRepository
 # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT  id, peep, time, maker_id;

    # Returns an array of Peep objects in reverse chronological order.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, peep, time, maker_id FROM peeps WHERE id = $1;

    # Returns a single post object.
  end

  def create(post)
    # INSERT INTO post
    # (id, peep, time, maker_id)
    # VALUES (post.peep, post.time, post.maker_id;
    # returns nil
  end
end


```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES
#MakerRepository
# 1
# Get all maker

repo = MakerRepository.new

user = repo.all

user.length # =>  2

user[0].id # =>  '1'
user[0].name # =>  'name1'
user[0].username # =>  'user1'
user[0].email # => 'name1@email.com'
user[0].password # => 'password1'

user[1].id # =>  '2'
user[1].name # =>  'name2'
user[1].username # =>  'user2'
user[1].email # => 'name2@email.com'
user[1].password # => 'password2'

# 2
# Get a single maker

repo = MakerRepository.new

user = repo.find(1)

user.id # =>  '1'
user.name # =>  'name1'
user.username # =>  'user1'
user.email # => 'name1@email.com'
user.password # => 'password1'

# 3
# create a new user

repo = MakerRepository.new

new_user.name # =>  'name3'
new_user.username # =>  'user3'
new_user.email # => 'name3@email.com'
new_user.password # => 'password3'

repo.create(new_user)

users = repo.all

expect(users).to include(
  have_attributes(
    id: new_user.id,
    name: new_user.name,
    username: new_user.username,
    email: new_user.email,
    password: new_user.password
    )
  ) # => returns an array including the new object

#PeepRepository
# 1
# Get all maker

repo = PeepRepository.new

post = repo.all

post.length # =>  2

post[0].id # =>  '1'
post[0].peep # =>  'first peep'
post[0].time # =>  '2022-11-11 11:11:11'
post[0].maker_id # => '1'

post[1].id # =>  '2'
post[1].peep # =>  'second peep'
post[1].time # =>  '2022-12-12 12:12:12'
post[1].maker_id # => '1'

# 2
# Get a single peep

repo = PeepRepository.new

post = repo.find(1)

post[0].id # =>  '1'
post[0].peep # =>  'first peep'
post[0].time # =>  '2022-11-11 11:11:11'
post[0].maker_id # => '1'

# 3
# create a new peep

repo = PeepRepository.new

new_post.peep # =>  'third peep'
new_post.time # => '2022-03-03 03:03:03'
new_post.maker_id # => '1'

repo.create(new_post)

posts = repo.all

expect(posts).to include(
  have_attributes(
    id: new_post.id,
    peep: new_user.peep,
    time: new_user.time,
    maker_id: new_user.maker_id,
    )
  ) # => returns an array including the new object


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

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