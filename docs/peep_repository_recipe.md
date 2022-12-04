# Peep Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

```
# EXAMPLE

Table: peeps

Columns:
id | contents | time | account_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;

INSERT INTO accounts (email, password, name, username) VALUES 
('tom@gmail.com', 'pass1', 'Tom Seleiro', 'TomS'),
('robbie@gmail.com', 'word2', 'Robbie Kirkbride', 'rwmk'),
('shah@gmail.com', '123', 'Shah Hussain', 'SH99'),
('chris@gmail.com', 'password', 'Chris Hutchinson', 'HutchyC');

INSERT INTO peeps (contents, time, account_id) VALUES
('Contents 1', 2022-12-01 01:08:54.193, 1),
('Contents 2', 2022-12-01 05:08:54.193, 2),
('Contents 3', 2022-12-01 10:08:54.193, 3),
('second peep', 2022-12-01 15:08:54.193, 1),
('Another peep', 2022-12-01 20:08:54.193, 2),
('Trump for president', 2022-12-01 23:08:54.193, 4);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
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
  attr_accessor :id, :contents, :time, :account_id
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
    # SELECT id, contents, time, account_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, contents, time, account_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  def create(peep)
    # peep is an instance of Peep object
    # INSERT INTO peeps (contents, time, account_id) VALUES ($1, $2, $3);
    # Returns nothing
  end

  def delete(id)
    # id is an integer
    # DELETE FROM peeps WHERE id = $1;
    # Returns nothing
  end

  def update(peep)
    # peep is an instance of Peep object
    # UPDATE peeps SET contents = $1, views = $2, account_id = $3 WHERE id = $4;
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
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  6

peeps[0].id # =>  1
peeps[0].contents # =>  'Contents 1'
peeps[0].time # =>  '2022-12-01 01:08:54.193'
peeps[0].account_id # =>  1

peeps[1].id # =>  2
peeps[1].contents # =>  'Contents 2'
peeps[1].time # =>  '2022-12-01 05:08:54.193'
peeps[1].account_id # =>  2

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(3)

peep.id # =>  3
peep.contents # =>  'Contents 3'
peep.time # =>  '2022-12-01 10:08:54.193'
peep.account_id # =>  3

# 3
# Create a single peep

repo = PeepRepository.new
peep = Peep.new
peep.contents #=> 'Something controversial'
peep.time #=> '2022-12-02 10:10:10.193'
peep.account_id #=> 1
repo.create(peep)

all_peeps = repo.all
all_peeps.last.id #=> 7
all_peeps.last.contents #=> 'Something controversial'
all_peeps.last.account_id #=> 1
all_peeps.last.time #=> '2022-12-02 10:10:10.193'

# 4
# Delete a single peep
repo = PeepRepository.new
repo.delete(3)
peeps = repo.all
peeps.length #=> 5
peeps[0].id #=> 1
peeps[1].id #=> 2
peeps[2].id #=> 4

# 5
# Update a single peep
repo = PeepRepository.new
new_peep = repo.find(2)
new_peep.contents = "Contents 5"
new_peep.time = '2022-12-03 10:10:10.193'
repo.update(new_peep)
peep = repo.find(2)
peep.contents # => "Contents 5"
peep.time # => '2022-12-03 10:10:10.193'
peep.account_id # => 2

# 6
# create fails if account_id doesn't exist in accounts table
repo = PostRepository.new
post = Post.new
post.account_id = 100
peep.contents = "Something"
repo.create(post) # => raises error

# 7
# update fails if account_id doesn't exist in accounts table
repo = PostRepository.new
post = repo.find(2)
post.account_id = 100
repo.update(post) # => raises error

# 8
# Deleting account deletes all posts linked to it
account_repo = AccountReporsitory.new
post_repo = PostReporsitory.new
account_repo.delete(1)
all_posts = post_repo.all
all_posts.length # => 2
all_posts.first.id # => 2
all_posts.first.title # => "Title 2"
all_posts.first.contents # => "Contents 2"
all_posts.first.views # => 100
all_posts.first.account_id # => 2
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/posts_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (your tests will go here).
end
```
