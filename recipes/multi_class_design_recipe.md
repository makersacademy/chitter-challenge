{{Albums}} Model and Repository Classes Design Recipe


1. Design and create the Table √


2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_chitter.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,so we can start with a fresh state.

-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email, username, password) VALUES ('Janet Blane', janet11@gmail.com, janet11, password);
INSERT INTO users (name, email, username, password) VALUES ('Marcus Jones', marcusj123@gmail.com, marcus123, password123);
INSERT INTO users (name, email, username, password) VALUES ('Ray Holt', raymondholt@gmail.com, ray_holt, cheddar007);

INSERT INTO peeps (contents, time, user_id) VALUES ('hello peeps', 2023-01-08 04:05:06, 1);
INSERT INTO peeps (contents, time, user_id) VALUES ('I love dogs', 2021-09-25 13:20:05, 2);
INSERT INTO peeps (contents, time, user_id) VALUES ('coding is fun', 2020-03-23 22:15:45, 3);


Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.
```ruby

# Model class
# (in lib/albums.rb)
class User
end

# Repository class
# (in lib/album_repository.rb)
class UserRepository
end

# Model class
# (in lib/albums.rb)
class Peep
end

# Repository class
# (in lib/album_repository.rb)
class PeepRepository
end
```

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.
```ruby

# Model class
# (in lib/user.rb)
class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :email, :username, :password
end

# Model class
# (in lib/peep.rb)

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :contents, :time, :user_id
end

```

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.


```ruby 

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, email, username, and password FROM users;

    # Returns an array of user objects.
  end

  def find(id)
    # executes the SQL query: 
    # SELECT id, name, email, username, and password FROM users WHEN id = $1; 

    #returns a single user 
  end 

  def create(user)
    # executes the SQL query: 
    # INSERT INTO users (name, email, username, password) VALUES($1, $2, $3, $4);

    # returns nothing 
  end
end



# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, contents, time, and user_id FROM peeps;

    # Returns an array of peep objects.
  end

  def find(id)
    # executes the SQL query: 
    # SELECT id, contents, time, and user_id FROM peeps WHEN id = $1; 

    #returns a single user 
  end 

  def create(user)
    # executes the SQL query: 
    # INSERT INTO peeps (contents, time, user_id) VALUES($1, $2, $3);

    # returns nothing 
  end
end
```


6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.
```ruby 
# EXAMPLES

# 1
# Get all peeps

repo = UserRepository.new

users = repo.all

users.length => 3 
users.first.id => "1"
users.first.name => "Janet Blane"
users.first.email => "janet11@gmail.com"
users.first.username => "janet11"
users.first.password => "password"

# 2
# get a single user 

repo = UserRepository.new

user = repo.find(1)
user.name => "Janet Blane"
user.email => "janet11@gmail.com"
user.username => "janet11"
user.password => "password"

# 3
# get a single user

repo = UserRepository.new

user = repo.find(3)
user.name => "Ray Holt"
user.email => "raymondholt@gmail.com"
user.username => "ray_holt"
user.password => "cheddar007"

('hello peeps', 2023-01-08 04:05:06, 1);
INSERT INTO peeps (contents, time, user_id) VALUES ('I love dogs', 2021-09-25 13:20:05, 2);
INSERT INTO peeps (contents, time, user_id) VALUES ('coding is fun', 2020-03-23 22:15:45, 3);
# 4
# Create a new user

repo = UserRepository.new

user = User.new
user.name = 'Jake Peralta'
user.email = 'jakeyboi2000@gmail.com'
user.username = 'jakeyboi2000'
user.password = 'brooklyn99'

repo.create(user) => nil

users =  repo.all 

last_user = user.last 
last_user.name  => 'Jake Peralta'
last_user.email  => 'jakeyboi2000@gmail.com'
last_user.username = 'jakeyboi2000'
last_user.password = 'brooklyn99'


# EXAMPLES

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length => 3 
peeps.first.id => "1"
peeps.first.contents => "hello peeps"
peeps.first.time => "2023-01-08 04:05:06"
peeps.first.user_id => "1"

# 2
# get a single user 

repo = PeepRepository.new

peep = repo.find(1)
peep.id => "1"
peep.contents => "hello peeps"
peep.time => "2023-01-08 04:05:06"
peep.user_id => "1"

# 3
# get a single user

repo = PeepRepository.new

peep = repo.find(3)
peep.id => "3"
peep.contents => "coding is fun"
peep.time => "2020-03-23 22:15:45"
peep.user_id => "3"

# 4
# Create a new user

repo = PeepRepository.new

peep = Peep.new
peep.contents = 'Going shopping!'
peep.time = '2023-02-11 18:04:15'
peep.user_id = '2'

repo.create(peep) => nil

peeps =  repo.all 

last_peep = peeps.last 
last_peep.contents = 'Going shopping!'
last_peep.time = '2023-02-11 18:04:15'
last_peep.user_id = '2'
```



7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

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
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.