# Users and Peeps Model and Repository Classes Design Recipe

## 1. Design and create the Table

```
Table: users

Columns:
id | name | email | password

Table: peeps

Columns:
id | message | date | user_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_users_peeps.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users ('name', 'email', 'password') VALUES ('David', 'david@example.com', '1234');
INSERT INTO users ('name', 'email', 'password') VALUES ('Anna', 'anna@email.co.uk', 'password');
INSERT INTO users ('name', 'email', 'password') VALUES ('Mike', 'mike@mail.com', 'hg46d');
INSERT INTO users ('name', 'email', 'password') VALUES ('Rob', 'rob@bob.uk', 'dk58as');

INSERT INTO peeps ('message', 'date', 'user_id') VALUES ('It is raining today', '2022-08-08', 1 );
INSERT INTO peeps ('message', 'date', 'user_id') VALUES ('Tonight we are going to take yoga classes', '2022-11-18', 2 );
INSERT INTO peeps ('message', 'date', 'user_id') VALUES ('Nice day to go to the beach here in Brighton ', '2022-07-01', 1 );
INSERT INTO peeps ('message', 'date', 'user_id') VALUES ('Christams is around the corner', '2022-12-20', 3 );
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter < spec/seeds_users_peeps.sql
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
class PeepRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User

  attr_accessor :id, :name, :email, :password
  
end

# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep

  attr_accessor :id, :message, :date, :user_id

end


```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UsersRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, email, password FROM users;

    # Returns an array of User objects.
  end

  # Gets a single user by its email
  # One argument: the email (text)
  def find(email)
    # Executes the SQL query:
    # SELECT * FROM userss WHERE email = $1;

    # Returns a single User object.
  end

  def add(user)
    #Executes the SQL query:
    # INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id;
  end

  def sign_in(email, password)
    # Finds user by email 
  end
  
end

# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, message, date, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  def add(peep)
    #Executes the SQL query:
    # INSERT INTO peeps (message, date, user_id) VALUES ($1, $2, $3);
  end


end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES FOR USER REPO

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  4

users[0].id # =>  1
users[0].name # =>  'David'
users[0].email # =>  'david@example.com'
users[0].password # => '1234'

users[1].id # =>  2
users[1].name # =>  'Anna'
users[1].email # =>  'anna@email.co.uk'
users[1].password # => 'password'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find('mike@mail.com')

user.id # =>  3
user.name # =>  'Mike'


# 3
# Add user
repo = UserRepository.new

new_user = User.new

new_user.name # => 'Sandra'
new_user.email # => 'sandra@spain.es'
new_user.password # => 'contrasenia1234'

repo.add(new_user)


user.last.name # => 'Sandra'
user.last.email # => 'sandra@spain.es'
user.last.password # => 'contrasenia1234'

# 4
# Signs in user if user alredy exists
repo = UserRepository.new

user = repo.sign_in('david@example.com', '1234')
user = 'You are now signed in! Enjoy.'



# EXAMPLES FOR PEEP REPO

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  4

peeps[0].id # =>  1
peeps[0].message # =>  'It is raining today'
peeps[0].date # =>  '2022-08-08'
peeps[0].user_id # => '1'

peeps[1].id # =>  2
peeps[1].message # =>  'Tonight we are going to take yoga classes'
peeps[1].date # =>  '2022-11-18'
peeps[1].user_id # => '2'

# 2
# Add peep
repo = PeepRepository.new

new_peep = Peep.new

new_peep.message # => 'Lovely day today'
new_peep.date # => '2023-01-12'
new_peep.user_id # => '4'

repo.add(new_peep)
peeps = repo.all

peep.last.message # => 'Lovely day today'
peep.last.date # => '2023-01-12'
peep.last.user_id # => '4'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/user_repository_spec.rb
# file: spec/peep_repository_spec.rb

def reset_users_peeps_table
        seed_sql = File.read('spec/seeds_users_peeps.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
        connection.exec(seed_sql)
      end
      
     
    before(:each) do 
        reset_users_peeps_table
    end

    after(:each) do
        reset_users_peeps_table
    end
end

```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

