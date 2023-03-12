# Peeps Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_users_peeps.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('magpie@mail.com', 'magpie2023', 'Magpie', 'Mag Pie')
INSERT INTO users (email, password, name, username) VALUES ('mockingbird@mail.com', 'mockingbird2023', 'Mockingbird', 'Mocking Bird')
INSERT INTO users (email, password, name, username) VALUES ('nightingale@mail.com', 'nightingale2023', 'Nightingale', 'Night Ingale')

INSERT INTO peeps (content, date_time, user_id) VALUES ('Mag mag mag Pie', '2023-01-08 10:00:00', '1')
INSERT INTO peeps (content, date_time, user_id) VALUES ('Mock mock mock Ingbird', '2023-01-10 13:30:00', '2')
INSERT INTO peeps (content, date_time, user_id) VALUES ('Night night night Ingale', '2023-01-13 18:20:00', '3')

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter < seeds_users_peeps.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
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
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :date_time, :user_id
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, date_time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Selects a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, date_time, user_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # Creates a new record
  # One argument: a new Peep Object
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, date_time, user_id) VALUES ($1, $2, $3);

    # Does not return a value
  end

  # Deletes a record
  # One argument: the id (number)
  def delete(id)
    # Executes the SQL query:
    # DELETE FROM peeps WHERE id = $1;
    
    # Does not return a value
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

peeps.length # => 3

peeps[0].id # => 1
peeps[0].content # => 'Mag mag mag Pie'
peeps[0].date_time # => '2023-01-08 10:00:00'
peeps[0].user_id # => 1

peeps[1].id # => 2
peeps[1].content # => 'Mock mock mock Ingbird'
peeps[1].date_time # => '2023-01-10 13:30:00'
peeps[1].user_id # => 2

peeps[2].id # => 3
peeps[2].content # => 'Night night night Ingale'
peeps[2].date_time # => '2023-01-13 18:20:00'
peeps[2].user_id # => 3

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.content # => 'Mag mag mag Pie'
peep.date_time # => '2023-01-08 10:00:00'
peep.user_id # => 1

# 3
# Creates a new peep

repo = PeepRepository.new

peep = Peep.new
peep.content = 'Pie pie pie Mag'
peep.date_time = '2023-01-09 11:00:00'
peep.user_id = 1

repo.create(peep)

all_peeps = repo.all # => all_peeps should contain the new peep

# 4
# Deletes a peep

repo = PeepRepository.new

repo.delete(1)

all_peeps = repo.all # => all_peeps should not contain the deleted peep

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds_users_peeps.sql')
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

