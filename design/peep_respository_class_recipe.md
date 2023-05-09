# Peep Model and Repository Classes Design Recipe


## 1. Design and create the Table

```
# EXAMPLE

Table: peeps

Columns:
id | time | contents | account_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE peeps RESTART IDENTITY;


INSERT INTO peeps ("time", "contents", "account_id") VALUES
('2023-05-09 11:09:00', 'hello, this is the first peep!', 1),
('2023-05-09 11:10:30', 'hello, this is the second peep!', 2),
('2023-05-09 11:12:00', 'hello, this is the third peep!', 3)
```


## 3. Define the class names

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
  attr_accessor :id, :time, :contents, :account_id
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

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, time, contents, account_id FROM peeps;

    # Returns an array of peep objects.
  end

  # Creates a new Peep
  # Takes a peep object as an argument
  def add(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (time, contents, account_id) VALUES ($1, $2, $3);'

    # Returns nil, just creates an object.
  end
end
```

## 6. Write Test Examples

```ruby

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  3

peeps.first.id # =>  1
peeps.first.time # =>  '2023-05-09 11:09:00'
peeps.first.contents # =>  'hello, this is the first peep!'
peeps.first.account_id # => 1

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  1
peep.time # =>  '2023-05-09 11:09:00'
peep.contents # =>  'hello, this is the first peep!'
peep.account_id # => 1


# 3 
# Add a peep

repo = PeepRepository.new

new_peep = Peep.new

new_peep.time = Time.now
new_peep.contents = "we are adding a new peep!"
new_peep.account_id = 1

repo.create(new_peep)

peeps = repo.all

peeps.length # => 4
peeps.last.contents # => "we are adding a new peep!"
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

end
```

## 8. Test-drive and implement the Repository class behaviour

