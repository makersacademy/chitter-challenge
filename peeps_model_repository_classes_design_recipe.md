peeps Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table peeps

```sql

# EXAMPLE

Table: peeps

Columns:
id |peep_content, time_posted, user_id
2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.



```
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < chitter.sql
psql -h 127.0.0.1 chitter_test < seeds_peeps.sql
``` 


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
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
4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.
```ruby
# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peeps.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :peep_content, :time_posted, :user_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# peep = Peep.new
# peep.peep_content = 'Hello Chitter!'
# peep.user_id = '3'

```
You may choose to  test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.
```ruby
# EXAMPLE
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, peep_content, time_posted, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # inserts a new peep record
  # takes an Peep object as an argument
  def create(peep)
    # executes the SQL query
    # INSERT INTO peeps (peep_content, time_posted, user_id ) VALUES ($1, $2, $3);

    # returns the record
  end

    # updates a peep record
    #takes an Peep object as an argument
  def find(id)
    # executes the SQL query
    #returns peep
  end
end
```
6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES
```ruby
# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  9

peeps[0].peep_content # =>  'Using Chitter for the first time!'
peeps[0].time_posted # =>  '2023-01-15 17:30:56''
peeps[0].user_id # =>  '2'


# 2
# Gets a single peep

repo = PeepRepository.new

peep = repo.find(2)

peep.peep_content # =>  'Using Chitter for the first time!'
peep.time_posted # =>  '2023-01-15 17:30:56''
peep.user_id # =>  '2'

# 3
# Creates a new peep
repo = PeepRepository.new
new_peep = Peep.new
new_peep.peep_content = 'Alec'
new_peep.time_posted = 'keyboard'
new_peep.user_id = 'alec@icloud.com'

repo.create(new_peep)  #=> nil
peeps = repo.all
last_peep = peeps.last
last_peep.user_id # => '10'
last_peep.peep_content # => 'Carry on!'

# 4. Deletes a peep  
# repo = PeepRepository.new
# id_to_delete = 1
# repo.delete(id_to_delete)
# all_peeps = repo.all
# all_peeps.length #=> 8
# all_peeps.first.id #=> '2'

#  # 5. Updates an peep by value

#  repo = PeepRepository.new
#  peep = repo.find(1)
#  peep.peep_content = 'Something else'
 
# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.
```
# EXAMPLE

# file: spec/peep_repository_spec.rb
```ruby
def reset_peeps_table
  seed_peeps_sql = File.read('spec/seeds_peeps.sql')
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
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

