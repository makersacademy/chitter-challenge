# Chitter Peeps & Users - Model and Repository Classes Design Recipe


## 1. Design and create the Table


```
Table: peeps

Columns:
id | content | time | user_id

Table: users

Columns:
id | name | email | username

```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_chitter.sql)

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE peeps, users, peeps_users RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email, username) VALUES ('Caroline', 'carolinesemail@email.com', 'caro');
INSERT INTO users (name, email, username) VALUES ('Philip', 'philsemail@email.com', 'phil');


INSERT INTO peeps (content, time, user_id) VALUES ('This is the first Peep', '20230506 10:22:09 AM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the second Peep', '20230507 03:35:35 PM', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the third Peep', '20230508 09:42:01 AM', 2);
INSERT INTO peeps (content, time, user_id) VALUES ('This is the forth Peep', '20230509 11:12:59 PM', 2);

INSERT INTO peeps_users (peep_id, user_id) VALUES (1, 2);
INSERT INTO peeps_users (peep_id, user_id) VALUES (2, 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < seeds_chitter.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

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

# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :user_id
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,

# Table name: users

# Model class
# (in lib/user.rb)

class User
  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :email, :username
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

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);

    # returns nil
  end

  def find_by_owner(user_id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE user_id = $1;

    # Returns an array of Peep objects.
  end

  def find_by_tagged_user(user_id)
    # Executes the SQL query:
    # SELECT peeps.id, peeps.content, peeps.time, peeps.user_id FROM peeps JOIN peeps_users ON peeps.id = peeps_users.peep_id JOIN users ON users.id = peeps_users.user_id WHERE users.id = $1;

    # Returns an array of Peep objects.
  end

end

# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  def find(username)
    # Executes the SQL query:
    # SELECT id, name, email, username FROM users WHERE username = $1;

    # Returns a User object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, username) VALUES ($1, $2, $3);

    # returns nil
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# Peeps testing
# 1
# Get all peeps
repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  4

peeps[0].id # =>  1
peeps[0].content # =>  'This is the first Peep'
peeps[0].time # =>  '20230506 10:22:09 AM'
peeps[0].user_id # => 1

peeps[1].id # =>  2
peeps[1].content # =>  'This is the second Peep'
peeps[1].time # =>  '20230507 03:35:35 PM'
peeps[1].user_id # => 1

peeps[2].id # =>  3
peeps[2].content # =>  'This is the third Peep'
peeps[2].time # =>  '20230508 09:42:01 AM'
peeps[2].user_id # => 2

peeps[3].id # =>  4
peeps[3].content # =>  'This is the forth Peep'
peeps[3].time # =>  '20230509 11:12:59 PM'
peeps[3].user_id # => 2

# 2
# creates a new peep
peep = Peep.new
peep.content = 'This is the fifth Peep'
peep.time =  '20230422 08:22:46 PM'
peep.user_id = 2

repo = PeepRepository.new

repo.create(peep)

last_peep = repo.all.last

last_peep.id # =>  5
last_peep.content # =>  'This is the fifth Peep'
last_peep.time # =>  '20230422 08:22:46 PM'
last_peep.user_id # => 2

# 3
# find all peeps by the same user
repo = PeepRepository.new

peeps = repo.find_by_owner(1)

peeps.length # =>  2

peeps[0].id # =>  1
peeps[0].content # =>  'This is the first Peep'
peeps[0].time # =>  '20230506 10:22:09 AM'
peeps[0].user_id # => 1

peeps[1].id # =>  2
peeps[1].content # =>  'This is the second Peep'
peeps[1].time # =>  '20230507 03:35:35 PM'
peeps[1].user_id # => 1

# 4
# find all peeps that a user is tagged in

repo = PeepRepository.new

peeps = repo.find_by_tagged_user(1)

peeps.length # =>  0

peeps = repo.find_by_tagged_user(2)

peeps.length # =>  2

peeps[0].id # =>  1
peeps[0].content # =>  'This is the first Peep'
peeps[0].time # =>  '20230506 10:22:09 AM'
peeps[0].user_id # => 1

peeps[1].id # =>  2
peeps[1].content # =>  'This is the second Peep'
peeps[1].time # =>  '20230507 03:35:35 PM'
peeps[1].user_id # => 1


# User testing
# 1
# find a user 

repo = UserRepository.new

user = repo.find('phil')

user.id # =>  2
user.name # =>  'Philip'
user.email # =>  'philsemail@email.com'
user.username # => 'phil'


# 2
# create a new user

user = User.new
user.name = 'Pip'
user.email =  'pipsemail@email.com'
user.username = 'pip1'

repo = UserRepository.new

repo.create(user)

last_user = repo.find('pip1')

last_user.id # =>  3
last_user.name # =>  'Pip'
last_user.email # =>  'pipsemail@email.com'
last_user.username # => 'pip1'


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/peep_repository_spec.rb

def reset_chitter_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_chitter_tables
  end

  # (your tests will go here).
end

# file: spec/user_repository_spec.rb

def reset_chitter_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_tables
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._