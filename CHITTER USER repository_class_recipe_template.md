# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | name | cohort_name
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

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES('Ricki Tarr', 'scalphunter', 'RickiTarr@mi5.com', 'abc123');
INSERT INTO users (name, username, email, password) VALUES('Bill Haydon', 'tailor', 'BillHaydon@kgb.net', 'witchcraft');
INSERT INTO peeps (peep_content, peep_date, user_id) VALUES('I am going to tell you a story...', timestamp '2023-01-01 00:00:00.001', 1);
INSERT INTO peeps (peep_content, peep_date, user_id) VALUES('Dear, dear Anne...', timestamp '2023-02-02 02:00:00.001', 2);



```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class Users
end

# Repository class
# (in lib/student_repository.rb)
class UserRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)



class Users
end

# Repository class
# (in lib/student_repository.rb)
class UserRepository
end


class User
  attr_accessor :id, :name, :username, :email, :password
end

  # Replace the attributes by your own columns.


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
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class UserRepository
  # Selecting all records
  # No arguments
  
  def all
    # Executes the SQL query:
    # SELECT * FROM users;
    # Returns an array of Student objects.
  end

  def find(id)
    # Executes the SQL query:
    # SELECT * FROM users WHERE id = $1;
  end
  
  def create(user)
   # INSERT INTO users (:name, :username, :email, :password) VALUES ($1, $2, $3, $4);'
  end

  def delete(user)
  # DELETE FROM users WHERE id = $1; 
  end

end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users


repo = OrderRepository.new

users = repo.all

users.length # =>  2

users[0].id # => 1
users[0].name # =>  'Ricki Tarr'
users[0].username # =>  'scalphunter'
users[0].email # => 'RickiTarr@mi5.com'
users[0].password # => 'abc123'

users[1].id # => 2
users[1].name # =>  'Bill Haydon'
users[1].username # =>  'tailor'
users[1].email # => 'BillHaydon@kgb.net'
users[1].password # => 'witchcraft'


# 2
# Gets a single user

repo = OrderRepository.new
single_order = repo.find(1)
single_user[0].id # => 1
single_user[0].name # =>  'Ricki Tarr'
single_user[0].username # =>  'scalphunter'
single_user[0].email # => 'RickiTarr@mi5.com'
single_user[0].password # => 'abc123'

# 3
# Creates a single user
repo = OrderRepository.new
new_user = Order.new
new_user.name # =>  'Peter Guillam'
new_user.username # =>  'lamplighter'
new_user.email # => 'PeterGuillam@mi5.com'
new_user.password # => 'karate'
repo.create(new_user)
find_new_user = repo.find(3)
find_new_user.name # =>  'Peter Guillam'
find_new_user.username # =>  'lamplighter'
find_new_user.email # => 'PeterGuillam@mi5.com'
find_new_user.password # => 'karate'

# 4
# Deletes a single user
repo = OrderRepository.new
repo.delete(1)
users = repo.all
users.length # =>  1
users[0].name # =>  'Bill Haydon'
users[0].username # =>  'tailor'
users[0].email # => 'BillHaydon@kgb.net'
users[0].password # => 'witchcraft'


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
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe OrderRepository do
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

<!-- END GENERATED SECTION DO NOT EDIT -->
