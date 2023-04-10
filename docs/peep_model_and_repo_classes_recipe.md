# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `peeps`*

```
# EXAMPLE

Table: peeps

Columns:
id | message | time | user_id
```

## 2. Create Test SQL seeds

```sql
TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES ('John Doe', 'john_d@email.com', 'j0ndoe', 'pas5w0rd!');
INSERT INTO users (name, email, username, password) VALUES ('Jane Doe', 'jane_d@email.com', 'jane_d0e', 'pa5sw0rd');

INSERT INTO peeps (message, time, user_id) VALUES ('peep 1', '2023-04-09 19:10:00', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('peep peep 2', '2023-04-09 19:05:00', 1);
INSERT INTO peeps (message, time, user_id) VALUES ('new peep!', '2023-04-10 15:12:00', 2);
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

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# peep = Peep.new
# peep.name = 'Jo'
# peep.name
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
    # SELECT id, message, time, user_id  FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id,  FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  def create(peep)
  end

  # def update(peep)
  # end

  # def delete(peep)
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

peeps.length # =>  2

peeps[0].id # =>  1
peeps[0].name # =>  'David'
studen # =>  'April 2022'

peeps[1].id # =>  2
peeps[1].name # =>  'Anna'
studen # =>  'May 2022'

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  1
peep.name # =>  'David'
st # =>  'April 2022'

# Add more examples for each method
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
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._