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

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (timestamp, content, maker_id) VALUES ('2023-03-13 04:50:51', 'Are birds weather?', 1);
INSERT INTO peeps (timestamp, content, maker_id) VALUES ('2023-03-13 04:52:59', 'How much string is there in the world?', 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < seeds.sql
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
# Table name: students

# Model class
# (in lib/student.rb)

class Peep
  attr_accessor :id, :timestamp, :content, :maker_id
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
    # SELECT id, timestamp, content, maker_id FROM peeps;

    # Returns an array of Peep objects.
  end


  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (timestamp, content, maker_id) VALUES ($1, $2, $3);

    #returns a new peep object
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

peeps.length # =>  2

peeps[0].id # =>  1
peeps[0].timestamp # =>  '2023-03-13 04:50:51'
peeps[0].content # => 'Are birds weather?'
peeps[0].maker_id # => 1

peeps[1].id # =>  2
peeps[1].timestamp # =>  '2023-03-13 04:52:59'
peeps[1].content # => 'How much string is there in the world?'
peeps[1].maker_id # => 2

# 2
# create a new Peep

repo = PeepRepository.new

peep = Peep.new
peeps[0].timestamp =  '2023-03-13 06:22:10'
peeps[0].content = 'My bucket of water is upside down.'
peeps[0].maker_id = 1

makers = repo.all

peeps[0].id # =>  3
peeps[0].timestamp # =>  '2023-03-13 06:22:10'
peeps[0].content # => 'My bucket of water is upside down.'
peeps[0].maker_id # => 1
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
