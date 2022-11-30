{{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table
If the table is already created in the database, you can skip this step.

Tables is already created

## 2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 1 context', '2022-10-06 09:46:42', '1');

INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 2 context', '2022-10-06 09:48:42', '1');

INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 3 context', '2022-10-05 09:48:42', '2');

INSERT INTO peeps (context, time_and_date, user_id) VALUES ('peep 4 context', '2022-10-05 09:40:42', '2');


-- Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.
```


## 3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

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

## 4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :context, :time_and_date, :user_id
end


You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

## 5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.


# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, context, time_and_date, user_id FROM peeps;

    # Returns an array of Peep objects.
  end
  def create(peep)
    #execute SQL query:
    sql = 'INSERT INTO 
            peeps (context, time_and_date, user_id) 
            VALUES($1, $2, $3);
  end
end

## 6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.
```ruby
# EXAMPLES

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all
peeps.length # => 4
peeps.first.id # => '1'
peeps.first.context # => 'peep 1 context'
peeps.first.time_and_date # => '2022-10-06 09:46:42'
peeps.first.user_id # => '1'

#4 create a new peep
repo = PeepRepository.new

peep = Peep.new
peep.context = 'peep 5 context'
peep.time_and_date = '2022-10-06 10:40:42'
peep.user_id = '1'

repo.create(peep)

peeps = repo.all

peeps.length # => 5

last_peep = peeps.last
last_peep.context # => 'peep 5 context'
last_peep.time_and_date # => '2022-10-06 10:40:42'


# Add more examples for each method
Encode this example as a test.
```

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end

## 8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.