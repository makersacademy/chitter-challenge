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
id | name | cohort_name
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: seeds/seeds_peeps.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (message, time, user_id) VALUES ('message1', '2022-01-10 01:01:01', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('message2', '2022-02-20 02:01:01', 2);
INSERT INTO peeps (message, time, user_id) VALUES ('message3', '2022-03-30 03:01:01', 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < seeds_peeps.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
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
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :message, :time, :user_id
end
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # Add more methods below for each operation you'd like to implement.

  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (message, time, user_id) VALUES ($1, $2, $3)

    # Returns nothing
  end
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
peeps[0].message # =>  'message1'
peeps[0].user_id # =>  1

peeps[1].id # =>  2
peeps[1].message # =>  'message2'
peeps[1].time # =>  '2022-02-20 02:01:01'

peeps[2].id # => 3
peeps[3].user_id # => 2

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(3)

peep.id # =>  3
peep.message # =>  'message3'
peep.time # =>  '2022-03-30 03:01:01'
peep.user_id # => 2

# 3
# Create a peep

new_peep = Peep.new
new_peep.message = 'message4'
new_peep.time = '2022-04-10 04:04:04'
new_peep.user_id = 1

repo = PeepRepository.new
repo.create(new_peep)

peeps = repo.all

peeps.length # => 4
peeps[-1].message # => 'message4'

# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('seeds/seeds_peeps.sql')
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
