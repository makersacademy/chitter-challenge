# MAKERS Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table


## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE makers RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO makers (name, username, email_address, password) VALUES ('Jim Slick','Jimbo', 'jimbo94@makersacademy.com', 'password123');
INSERT INTO makers (name, username, email_address, password) VALUES ('Flash Gordon','Flash', 'flashgordon@makersacademy.com', 'password789');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: makers

# Model class
# (in lib/maker.rb)
class Maker
end

# Repository class
# (in lib/maker_repository.rb)
class MakerRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: makers

# Model class
# (in lib/maker.rb)

class Maker

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :username, :email_address, :password
end
```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: makers

# Repository class
# (in lib/maker_repository.rb)

class MakerRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email_address, password FROM makers;

    # Returns an array of Maker objects.
  end

  def create(maker)
  # Executes the SQL query:
  # sql = 'INSERT INTO makers (name, username, email_address, password) VALUES ($1, $2, $3, $4);

  # Returns a new Maker object
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

repo = MakerRepository.new

makers = repo.all

makers.length # =>  2

makers[0].id # =>  1
makers[0].name # =>  'Jim Slick'
makers[0].username # => 'Jimbo'
makers[0].email_address # => 'jimbo94@makersacademy.com'
makers[0].password # =>  'password123'

makers[1].id # =>  2
makers[1].name # =>  'Flash Gordon'
makers[1].username # => 'Flash'
makers[1].email_address # => 'flashgordon@makersacademy.com'
makers[1].password # =>  'password789'

# 2
# create a new Maker

repo = StudentRepository.new

maker = Maker.new
maker.name = 'Hans Gruber'
maker.username = 'Bruce'
maker.email_address = 'hans_the_mans@makersacademy.com'
maker.password = 'Nakat0miPlaza'
repo.create(maker)

makers = repo.all

makers.last.id #=> 3
makers.last.name #=> 'Hans Gruber'
maker.username #=> 'Bruce'
maker.email_address #=> 'hans_the_mans@makersacademy.com'
maker.password #=> 'Nakat0miPlaza'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/maker_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
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
