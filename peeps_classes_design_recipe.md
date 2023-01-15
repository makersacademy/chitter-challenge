# PEEPS Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `peeps`*

```
# EXAMPLE

Table: peeps

Columns:
message | time | account_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_peeps.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps ("message", "time", "account_id") VALUES
('Today will be a good day', '09:15', 1),
('I am bored who is out?', '11:30', 3),
('Arsenal playing, buzzing!', '15:10', 2),
('Twisted my ankle today :(', '18:45', 1),
('Good win!', '22:00', 2);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_network < seeds_peeps.sql
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
# (in lib/account_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peep_repository.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :message, :time, :account_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# peep = Peep.new
# peep.message = 'Today will be a good day'
# peep.message
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
        # SELECT id, message, time, account_id FROM peeps;

        # Returns an array of Peep objects.
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(account_id)
        # Executes the SQL query:
        # SELECT id, message, time, account_id FROM peeps WHERE account_id = $1;

        # Returns an array of Peep objects with specific account_id 
    end

    # Inserts new Peep record into database
    def create(peep)
        # Executes the SQL query
        # INSERT into peeps (message, time, account_id) VALUES ($1, $2, $3, $4);

        # Returns nothing
    end

    #  Removes a Peep record from database
    def delete(peep)
        # Executes the SQL query
        # DELETE FROM peeps WHERE id = $1;

        # Returns nothing
    end

    def update(id, new_message)
        # Executes the SQL query
        # UPDATE peeps message = $1 WHERE id = $2

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
# Get all accounts

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  5

peeps[0].id # =>  1
peeps[0].message # =>  'Today will be a good day'
peeps[0].time # =>  '09:15'
peeps[0].account_id # => '1'


peeps[1].id # =>  2
peeps[1].message # =>  'I am bored who is out?'
peeps[1].time # =>  '11:30'
peeps[1].account_id # => '3'

peeps[2].id # =>  3
peeps[2].message # =>  'Arsenal playing, buzzing!'
peeps[2].time # =>  '15:10'
peeps[2].account_id # => '2'

...

# 2
# Get a single account

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  1
peep.message # =>  'Today will be a good day'
peep.time # =>  '09:15'
peep.account_id # => '1'

# 3
# Creates a new account

repo = PeepRepository.new


account = Peep.new
peep.message = 'Hello, everyone'
peep.time =  '08:30'
peep.account_id = '1'

peeps = repo.all
peeps[6].message = 'Hello, everyone'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/account_repository_spec.rb

def reset_accounts_table
  seed_sql = File.read('spec/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
