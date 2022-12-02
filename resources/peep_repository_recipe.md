# Peep Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

```
Table: peeps

Columns:
id | contents | time_posted, account_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds/seeds_peeps.sql)

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, password, name, username) VALUES
-- PASSWORD: password
('thomas@email.com', '$2a$12$1CrGiZefwfjMBHXzRwf.ROQtx1lt.vaXwbgAl1fQEJYXwVVwEY9LO', 'Thomas Seleiro', 'TSeleiro'),
-- PASSWORD: P@$$w0rd
('graeme@email.com', '$2a$12$fALqEuM793QuKQfp3x3H2e9B.5yM3ftUqGoBKk1a2bV3mt2fwoxri', 'Graeme Paterson', 'GPaterson'),
-- PASSWORD: '1234hello1234'
('robbie@email.com', '$2a$12$cHmw7YQKvYh/Fy/k37YUZuldl.b5Y3.cNpojS8Kn1yjmmE8y1trVa', 'Robbie Kirkbride', 'RKirkbride');

INSERT INTO peeps(contents, time_posted, account_id) VALUES
('My first peep', '2022-11-01 16:00:00', 1),
('My second peep', '2022-11-01 16:00:30', 1),
('Hello', '2022-11-02 09:30:14', 2),
('Test', '2022-11-02 16:00:30', 3),
('My third peep', '2022-11-03 07:13:49', 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_db < spec/seeds/seeds_peeps.sql
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
  attr_accessor :id, :contents, :time_posted, :account_id
end
```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository
  # Initialises peep repository with timer
  # timer is an object with a #now method
  def initialize(timer=Time)
  end

  # Selecting all records in reverse chronological order
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, contents, time_posted, account_id FROM peeps ORDER BY id DESC;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, contents, time_posted, account_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # Creates a new peep in the database (we set the time posted in this method)
  # peep is an instance of the Peep class
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (contents, time_posted, account_id) VALUES ($1, $2, $3);

    # Returns nothing.
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# 1
# Get all peeps in reverse chronological order
peep_repository = PeepRepository.new
peeps = peep_repository.all

peeps.length # => 5

peeps.first.id # => 5
peeps.first.contents # => "My third peep"
peeps.first.time_posted # => "2022-11-03 07:13:49"
peeps.first.account_id # => 1

peeps.first.id # => 1
peeps.first.contents # => "My first peep"
peeps.first.time_posted # => "2022-11-01 16:00:00"
peeps.first.account_id # => 1


# 2
# Find a peep with a specific id
peep_repository = PeepRepository.new
peep = peep_repository.find(4)

peep.id # => 4
peep.contents # => "Test"
peep.time_posted # => "2022-11-02 16:00:30"
peep.account_id # => 3


# 3
# #find fails with an IndexError when given an id that doesn't exist
peep_respository = PeepRepository.new
peep_repository.find(6) # => raises IndexError "There is no peep with ID 6"


# 4
# #create adds a peep to the database
timer = double(:fake_timer)
expect(timer).to receive(:now).and_return('2022-11-04 00:00:00')

peep_repository = PeepRepository.new(timer)

new_peep = Peep.new
new_peep.contents = "I added this peep from RSpec"
new_peep.account_id = 3

peep_repository.create(new_peep)

peep_repository.all # => include(have_attributes(id: 6, contents:, time_posted:, account_id:))


# 5
# #create fails (PG::ForeignKeyViolation) when adding a peep with an invalid account_id
timer = double(:fake_timer)
expect(timer).to receive(:now).and_return('2022-11-04 00:00:00')

peep_repository = PeepRepository.new(timer)

new_peep = Peep.new
new_peep.contents = "I added this peep from RSpec"
new_peep.account_id = 4

peep_repository.create(new_peep) # => fails with PG::ForeignKeyViolation


# 6
# #create fails (ArgumentError) when the contents are empty
timer = double(:fake_timer)
allow(timer).to receive(:now).and_return('2022-11-04 00:00:00')

peep_repository = PeepRepository.new(timer)

new_peep = Peep.new
new_peep.contents = ""
new_peep.account_id = 3

peep_repository.create(new_peep) # => fails (ArgumentError) "A peep cannot have empty contents"
```

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end
end
```
