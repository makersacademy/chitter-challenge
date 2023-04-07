# Peeps Model and Repository Classes Design Recipe

## 1. Design and create the Table

```
Table: peeps

Columns:
id | message | published | user_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO peeps (message, published, user_id) values('Just a test peep!', '2023-04-07', 1);
INSERT INTO peeps (message, published, user_id) values('Just another test peep!', '2023-04-07', 1);
INSERT INTO peeps (message, published, user_id) values('Just a random peep!', '2023-04-07', 2);


Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_peeps.sql
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
  attr_accessor :id, :message, :published, :user_id
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
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository
  # Select all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, message, published, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Insert a new peep
  # One argument
  def create(peep) # a peep object
    # Executes the SQL query:
    # INSERT INTO peeps (message, published, user_id) VALUES ($1, $2, $3);

    # Returns nothing
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# 1
# Get all peeps
repo = PeepRepository.new
peeps = repo.all

peeps.length # => 3

#2
# Get the first peep
repo = PeepRepository.new
peeps = repo.all
peeps.first.id # => "1"
peeps.first.message # => "Just a test peep!"
peeps.first.published # => "2023-04-07"
peeps.first.user_id # => "1"


# 3
# Create a new peep and check how many
repo = PeepRepository.new

peep = Peep.new
peep.message = "This peep was created on behalf of user: chitter_guy'"
peep.published = "2023-04-07"
peep.user_id = "3"
repo.create(peep)

all_peeps = repo.all
all_peeps.length # => 4

# 4
# Create a new peep and check the last insert
repo = PeepRepository.new

peep = Peep.new
peep.message = "This peep was created on behalf of user: gemmawhite99"
peep.published = "2023-04-07"
peep.user_id = "4"
repo.create(peep)

all_peeps = repo.all
all_peeps.last.message # => "This peep was created on behalf of user: gemmawhite99"
all_peeps.last.published # => "2023-04-07"
all_peeps.last.user_id # => "4"
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
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