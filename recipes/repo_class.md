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


TRUNCATE TABLE peeps,users RESTART IDENTITY;
 -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, username, name, password) VALUES 
('mosho@live.co.uk', 'Mosho', 'Moses', 'password'),
('layi@live.co.uk', 'Layi88', 'Layi', 'password2');
INSERT INTO peeps (username, name, content, time, user_id) VALUES 
('Mosho', 'Moses', 'My first peep!', 15:03:45),
('Layi88', 'Layi', 'Test peep 2', 16:00:00);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

class Peep
end

# Repository class
# (in lib/user_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/peep.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :name, :username, :password
end



class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :username, :name, :content, :user_id
end
# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# comment = comment.new
# comment.name = 'Jo'
# comment.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class UserRepository

  def all
    users = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, email, name, username, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      user = User.new
      user.id = record['id'].to_i
      user.email = record['email']
      user.name = record['name']
      user.username = record['username']
      user.password = record['password'].to_i

      users << user
    end

    return users
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def create(user)
    sql = 'INSERT INTO users (email, name, username, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.email, user.name, user.username, user.password])

    return user
  end

end


class PeepRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, username, name, content, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.username = record['username']
      peep.name = record['name']
      peep.content = record['content']
      peep.user_id = record['user_id'].to_i

      peeps << peep
    end

    return peeps
  end


  # Gets a single record by its ID
  # One argument: the id (number)
  def create(peep)
    sql = 'INSERT INTO peeps (username, name, content, user_id) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [peep.username, peep.name, peep.content, peep.user_id])

    return peep
  end

end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES


# 1
# Lists all peeps

peeps = PeepRepository.new

result = peeps.all(1)

result.length # => 2
result.first.name # => "Moses"

# Add more examples for each method

# 2
# Creates a peep

peeps = PeepRepository.new
peep = Peep.new
all the params of the peep to match
result = peeps.create(peep)

result.length # => 2
result.first.name # => "Moses"


# 1
# Creates a user

peeps = PeepRepository.new

result = peeps.all(1)

result.length # => 3
result.last.name # => "new user"

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
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
