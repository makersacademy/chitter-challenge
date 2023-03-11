# {{Chitter}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `chitter`*

```
# EXAMPLE

Table: chitters

Columns:
id | peep | time |user_id

Table: users

Columns:
id | user_name | email | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 
TRUNCATE TABLE chitters, users RESTART IDENTITY;
 -- replace with your own table name.
--this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users (user_name, email, password) VALUES ('bob', 'bob@gmail.com','password1');
INSERT INTO users (user_name, email, password) VALUES ('Anna', 'anna@hotmail.com','password2');
INSERT INTO users (user_name, email, password) VALUES ('Davinder', 'davinder@gmail.com', 'password3');
INSERT INTO users (user_name, email, password) VALUES ('Annad', 'annad@gmail.com','password4');


INSERT INTO chitters (contents, date, user_id ) VALUES ('Hey guys happy monday', 1.13, 1);
INSERT INTO chitters (contents, date, user_id ) VALUES ('Happy monday to you too!', 2.14, 2);
INSERT INTO chitters (contents, date, user_id ) VALUES ('Did you have any breakfast?',3.25, 3);
INSERT INTO chitters (contents, date, user_id ) VALUES ('Yea I had some chocolate', '2000',3.25, 4);

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE chitters, users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

DROP TABLE IF EXISTS "public"."chitters";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS books_id_seq;

-- Table Definition
table created in another design doc
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: chitter

# Model class
# (in lib/chitter.rb)
class chitter
end

# Repository class
# (in lib/chitter_repository.rb)
class chitter_repository
end

# EXAMPLE
# Table name: user

# Model class
# (in lib/user.rb)
class user
end

# Repository class
# (in lib/user_repository.rb)
class user_repository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: chitters

# Model class
# (in lib/chittert.rb)

class Chitters

  # Replace the attributes by your own columns.
  attr_accessor :id, :contents, :date
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
chitter
class user

  # Replace the attributes by your own columns.
  attr_accessor :id, :username, :email, :password
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
chitter
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name:chitter

# Repository class
# (in lib/chitter_repository.rb)

class ChitterRepository

  # Selecting all records
  # No arguments
  def all
    
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, author_name FROM book WHERE id = $1;

    # Returns a single Book object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(chitter)
  # end

  # def update(chitter)
  # end

  # def delete(chitter)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all students

repo = BookRepository.new
books = repo.all
books.first.id => 1
books.find.title => ''
books.first.title => ''




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

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->x