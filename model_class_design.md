# Chitter Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: chitter (users and peeps)

| Record                | Properties          |
| --------------------- | ------------------  |
| peep                  | content, date
| user                  | username, password, name, email
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, password, name, email) VALUES ('anna1', '123456', 'Anna Smith', 'anna@makersacademy.com');
INSERT INTO users (username, password, name, email) VALUES ('sjmog', 'password123', 'Sam Morgan', 'samm@makersacademy.com');

TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (content, date, user_id) VALUES ('Anna peep 1', '2022-08-17 07:37:16-08', 1);
INSERT INTO peeps (content, date, user_id) VALUES ('Sam peep 1', '2022-09-05 19:32:15-05', 2);
INSERT INTO peeps (content, date, user_id) VALUES ('Anna peep 2', '2022-09-01 13:47:52-02', 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter < seeds_peeps_users.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end


# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeppRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
  attr_accessor :id, :username, :password, :email, :name
end


# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
  attr_accessor :id, :content, :date, :user_id
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

  # Gets all peeps
  # no arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps 

    # Returns aan array of peep objects
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get a cohort with its associated students

repo = PeepRepository.new

peeps = repo.all

peeps.first.content #=> 'Anna peep 1'

peeps.first.date #=> '2022-08-17 07:37:16'

peeps.first.user.id # =>  '1'

peeps.length # =>  3
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
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
