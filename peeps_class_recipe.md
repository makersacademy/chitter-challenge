# {{PEEPS}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | content | date_time | user_id
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

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (content, user_id) VALUES ('peep 1', 1);
INSERT INTO peeps (content, user_id) VALUES ('peep 2', 2);
INSERT INTO peeps (content, user_id) VALUES ('peep 3', 1);
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
class Peep
end

# Repository class
# (in lib/student_repository.rb)
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

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :date_time, :user_id
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

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, content, date_time, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.date_time = record['date_time']
      peep.user_id = record['user_id']

      peeps << peep
    end

    return peeps
  end

  # Gets a single record by its ID
  # One argument: the id (number)
 def find(id)
    sql = 'SELECT id, content, date_time, user_id FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]['id']
    peep.content = result_set[0]['content']
    peep.date_time = result_set[0]['date_time']
    peep.user_id = result_set[0]['user_id']

    return peep
  end

  # create new peep

  def create(peep)
    sql = 'INSERT INTO peeps (content, date_time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.date_time, peep.user_id])

    return peep
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
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  3

peeps[0].id # =>  1
peeps[0].content # =>  'David'
peeps[0].date_time # =>  *check database for default timesatamp*
peeps[0].user_id # =>  1

peeps[1].id # =>  2
peeps[1].content # =>  'Anna'
peeps[1].date_time # =>  *check database for default timesatamp*
peeps[1].user_id # =>  2

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  '1'
peep.content # =>  'David'
peep.date_time # =>  *check database for default timesatamp*
peeps.user_id # =>  '1'

# 3
# create new peep

repo = PeepRepository.new

new_peep = Peep.new
new_peep.content =  'Content 4'
new_peep.user_id = 2
repo.create(new_peep)

peeps = repo.all

peeps.last.content # => 'Content 4'
peeps.last.date_time # => *check database for default timesatamp*
peeps.last.user_id # => '2'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

