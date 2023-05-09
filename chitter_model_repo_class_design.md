# Chitter Model and Repository Classes Design Recipe

## 1. Design and create the Table
DONE

## 2. Create Test SQL seeds

```sql

-- (file: spec/seeds_users.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username)
  VALUES ('lou@chitter.com', 'password01', 'Louis', 'lpc');

INSERT INTO users (email, password, name, username)
  VALUES ('luce@chitter.com', 'password02', 'Lucy', 'leh');


-- (file: spec/seeds_peeps.sql)

TRUNCATE TABLE users RESTART IDENTITY;
TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username)
  VALUES ('lou@chitter.com', 'password01', 'Louis', 'lpc');

INSERT INTO peeps (content, time, user_id)
  VALUES ('First post', '12:00', 1);

INSERT INTO peeps (content, time, user_id)
  VALUES ('Second post', '13:00', 1);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_site_test < chitter_tables.sql
psql -h 127.0.0.1 chitter_site_test < spec/seeds_users.sql
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
  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :password, :name, :username
end


# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :user_id, :tags

  def initialize
    @tags = []
  end

  def content=(str)
    @content = str
    @tags = find_tags(str)
  end

  private

  # A method for extracting the tags (`@username`) of other users
  # from peep content and returns them inside an array
  def find_tags(content)
    # returns an array of usernames beginning with `@`
  end
end


```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface


```ruby

# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM users WHERE id = $1;

    # Returns a single User object.
  end

  # Adds a new user to the database
  # One argument - a User object
  def create(user)
    # Executes the SQL:
    # INSERT INTO users (email, password, name, username)
    #   VALUES ($1, $2, $3, $4)

    # Returns nothing - updates the database
  end

  def find_with_peeps(id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM users WHERE id = $1;

    # Returns a single user object containing a .peeps attribute
    # with an array of Peep objects
  end

  # def update(user)
  # end

  # def delete(user)
  # end
end


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

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # Adds a new peep to the database
  # One argument - a Peep object
  def create(peep)
    # Executes the SQL:
    # INSERT INTO users (content, time, user_id)
    #   VALUES ($1, $2, $3)

    # Returns nothing - updates the database
  end


  # def update(peep)
  # end

  # def delete(peep)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# USER REPO:

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].email # =>  'lou@chitter.com'
users[0].password # =>  'password01'
users[0].name # =>  'Louis'
users[0].username # =>  'lpc'

users[1].id # =>  2
users[1].email # =>  'luce@chitter.com'
users[1].password # =>  'password02'
users[1].name # =>  'Lucy'
users[1].username # =>  'leh'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.email # =>  'lou@chitter.com'
user.password # =>  'password01'
user.name # =>  'Louis'
user.username # =>  'lpc'

# 3
# Add a new user to database

repo = UserRepository.new
user = User.new
user.email = 'newemail@chitter.com'
user.password = 'password03'
user.name = 'Jon'
user.username = 'doe'

repo.create(user)

new_user = repo.all.last

new_user.id # =>  3
new_user.email # =>  'newemail@chitter.com'
new_user.password # =>  'password03'
new_user.name # =>  'Jon'
new_user.username # =>  'doe'

# 4
# Finds specific user and their peeps

repo = UserRepository.new

user = repo.find_with_peeps(1)

user.id # =>  1
user.email # =>  'lou@chitter.com'

peep = user.peeps.first

peep.id # =>  1
peep.content # =>  'First post'
peep.time # =>  '12:00:00'
peep.user_id # =>  1


# Add more examples for each method


# PEEP MODEL CLASS:

# 1
# Initialises with empty tags array

peep = Peep.new
peep.tags # => []

# 2
# Tags array empty when content contains no tags
peep = Peep.new
peep.content = 'No tags here'

peep.tags # => []

# 3
# Extracts the tagged users when content has @ in
peep = Peep.new
peep.content = '@jamie is cool'

peep.tags # => ['@jamie']

# 4
# Extracts the tagged users when content has @ in
# without duplicating
peep = Peep.new
peep.content = '@jamie is cool but @stephen is cooler than @jamie'

peep.tags # => ['@jamie', '@stephen']


# PEEP REPO:

# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # => 2

peeps[0].id # =>  1
peeps[0].content # =>  'First post'
peeps[0].time # =>  '12:00:00'
peeps[0].user_id # =>  1

peeps[1].id # =>  1
peeps[1].content # =>  'Second post'
peeps[1].time # =>  '13:00:00'
peeps[1].user_id # =>  1

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  1
peep.content # =>  'First post'
peep.time # =>  '12:00:00'
peep.user_id # =>  1

# 3
# Add a new peep to database

repo = PeepRepository.new
peep = Peep.new
peep.content = 'New post'
peep.time = '15:00'
peep.user_id = 1

new_peep = repo.all.last

repo.create(peep)

peep.id # =>  3
peep.content # =>  'New post'
peep.time # =>  '15:00:00'
peep.user_id # =>  1

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
