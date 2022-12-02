# Users Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

see: chitter-challenge/design/Database/database_schema_design.md

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
TRUNCATE TABLE messages RESTART IDENTITY CASCADE; 
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

INSERT INTO users (username, email_address, password, full_name) VALUES ('Bloggy_J', 'joe_blogs@gmail.com', 'sxdfhcgjvhk2342','Joe_Bloggs');
INSERT INTO users (username, email_address, password,full_name) VALUES ('The_Migster', 'm_miggins@hotmail.com', '&gfdklwr3', 'Mrs_Miggins');
INSERT INTO users (username, email_address, password,full_name) VALUES ('Schmoe123', 'j_schmoe@gmail.com', '7gyhd88gg4', 'Joe_schmoe');
INSERT INTO users (username, email_address, password,full_name) VALUES ('not_elon', 'Meelon@tesla.com', '1filNfdvc£','Meelon Musk');

INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is a slightly longer peep that I have created', '2022-11-01 14:50:00', '2');
INSERT INTO messages (content, time_posted, user_id) VALUES ('This is a short post', '2022-12-01 19:10:25', '1');
INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is an even longer peep, to deemonstrate how a much longer post may look when stored in my chitter database. Some posts may be even longer!', '2022-07-01 08:10:00', '3');

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
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :username, :email_address, :full_name
end

```

## 5. Repository Class interface


```ruby

# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class Userepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT id, username, email_address, full_name FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, username, email_address, password, full_name FROM users WHERE id = $1;

    # Returns a single User object.
  end


  def create(user)
    # Executes the SQL query:
    #  sql = 'INSERT INTO users (username, email_address, password, full_name ) VALUES($1, $2, $3, $4);'
    #  sql_params = [user.username, user.email_address, user.password, user.full_name]
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
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  4

users[0].username # =>  'Bloggy_J'
users[0].email_address # =>  'joe_blogs@gmail.com'
users[0].password # =>  'sxdfhcgjvhk2342'
users[0].full_name # =>  'Joe_Bloggs'

users[1].username # =>  'The_Migster'
users[1].email_address # =>  'm_miggins@hotmail.com'
users[1].password # =>  '&gfdklwr3'
users[1].full_name # =>  'Mrs_Miggins'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(4)

user.username # =>  'not_elon'
user.email_address # =>  'Meelon@tesla.com'
user.password # =>  '1filNfdvc£'
user.full_name # =>  'Meelon Musk'

# 3 - get another user 


repo = UserRepository.new

user = repo.find(2)

user.username # =>  'Bloggy_J'
user.email_address # =>  'joe_blogs@gmail.com'
user.password # =>  'sxdfhcgjvhk2342'
user.full_name # =>  'Joe_Bloggs'

# 4 - Create a new user 

repo = UserRepository.new
user = User.new

user.username = 'new_user'
user.email_address = 'new_user@gmail.com'
user.password = '123abc&%_'
user.full_name = 'New User'

users = repo.all

users.length # => 5 

users.last.username # =>  'new_user'
users.last.email_address # =>  'new_user@gmail.com'
users.last.password # =>  '123abc&%_'
users.last.full_name # =>  'New User'


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

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._