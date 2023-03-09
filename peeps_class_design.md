 # {{Peeps}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter


## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

```sql
-- EXAMPLE
-- file: chitter_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text,
  password text,
);

-- Then the table with the foreign key.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time_of_post datetime,
  username,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
```


## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/chitter_seeds.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)


TRUNCATE TABLE peeps, users RESTART IDENTITY;
 -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.


INSERT INTO users (username, email_address, password) VALUES ('jamespates', 'james@gmail.com', 'Abc123De');
INSERT INTO users (username, email_address, password) VALUES ('amy_pates', 'amy@gmail.com', 'Abc123Df');
INSERT INTO users (username, email_address, password) VALUES ('ann_pates', 'ann@gmail.com', 'Abc123Dg');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('A good day', '2023-03-09 10:15:30.123456', '1');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('A bad day', '2023-03-08 10:15:30.123456', '2');
INSERT INTO peeps (message, time_of_post, user_id) VALUES ('An ok day', '2023-03-07 10:15:30.123456', '3');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipies_directory_test < seeds_recipies.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: Peeps

# Model class
# (in lib/peeps.rb)
class Peeps
end

# Repository class
# (in lib/peeps_repository.rb)
class PeepsRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peeps.rb)

class Peeps

  # Replace the attributes by your own columns.
  attr_accessor :id, :message, :time_of_post, :user_id
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
# (in lib/peeps_repository.rb)

class PeepsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, message, time_of_post, user_id FROM peeps;

    # Returns an array of Peep objects.
  end
end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, message, time_of_post, user_id FROM peeps WHERE id = $1;

    # Returns a single peep object.
  end

  def create(peep)
  #executes the sql query
  #INSERT INTO peeps (message, time_of_post, user_id) VALUES ($1, $2)
  #returns nil
  end

  def update(peep)
  #executes a sql query
  #UPDATE peeps SET message = $1, time_of_post = $2, user_id = $3 ) WHERE id = $4; 

  end

  def delete(peep)
    #executes a sql query
  #DELETE FROM peeps WHERE id = $1;
  #returns nothing just deletes the record. 
  end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all peep

repo = PeepsRepository.new

peeps = repo.all

peeps.length # =>  3

peeps[0].id # =>  1
peeps[0].message # =>  'A good day'
peeps[0].time_of_post # =>  '2023-03-09 10:15:30.123456'
peeps[0].user_id # =>  '1'

peeps[0].id # =>  2
peeps[0].message # =>  'A bad day'
peeps[0].time_of_post # =>  '2023-03-08 10:15:30.123456'
peeps[0].user_id # =>  '2'

# 2
# Get a single peep

repo = PeepsRepository.new

peep = repo.find(1)

peeps.id # =>  1
peeps.message # =>  'A good day'
peeps.time_of_post # =>  '2023-03-09 10:15:30.123456'
peeps.user_id # =>  '1'
# Add more examples for each method

#3 Creates a single peep record
repo = PeepsRepository.new

peep = Peeps.new
peep.message = "A really good day"
peep.time_of_post = '2023-03-06 10:15:30.123456'
peep.user_id = '4'

repo.create(peep)
peeps = repo.all

last_peep = peeps.last
last_peep.message  # =>  'A really good day'
peep.time_of_post #=> "2023-03-06 10:15:30.123456"
last_peep.user_id # => "4"

#4 updates a single peep record
repo = PeepsRepository.new

peep = repo.find(1)

peep.message = "An alright day"
peep.time_of_post = "2023-03-06 10:15:30.123456"
peep.user_id = '4'

repo.update(peep)

updated_peep = repo.find(1)

updated_peep.message # => "An alright day"
updated_peep.time_of_post # => "2023-03-06 10:15:30.123456"
updated_peep.user_id # => '4'

#5 deltes a single peep record
repo = PeepsRepository.new

id_to_delete = 1
repo.delete(id_to_delete)

all_peeps = repo.all
all_peeps.length # => 2
all_peeps.first.id # => 2
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peeps_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->