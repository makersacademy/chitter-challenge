# USER Model and Repository Classes Design Recipe

## 1. Design and create the Table

```
Table: users

Columns:
 id | name | username | email | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (name, username, email, password ) VALUES ('David', 'davidjs', 'david@makers.com', 'password1');
INSERT INTO users (name, username, email, password ) VALUES ('Anna', 'annang', 'anna@makers.com', 'password2');

INSERT INTO peeps(content, time, user_id) VALUES ('Do the solo chitter project', '2023-01-08 10:05:06', '1');
INSERT INTO peeps(content, time, user_id) VALUES ('Do the shop mamnager project', '2023-02-10 10:15:06', '2');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < spec/seeds_users.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

class User
end

class UserRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
class User
  attr_accessor :id, :name, :username, :email, :password
end

```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby

class UserRepository

  # Selecting all users
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users;

    # Returns an array of Users objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, username, email, password FROM users WHERE id = $1;

    # Returns a single User object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users

repo = UserRepository.new

users = repo.all

uers.length # =>  2

users[0].id # =>  1
users[0].name # =>  'David'


# 2
# Get a single student

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1

# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

  describe UserRepository do
    before(:each) do
      reset_users_table
    end

    # (your tests will go here).
  end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
