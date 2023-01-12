# User Model and Repository Classes Design Recipe

## 1. Design and create the Table

```
Table: users

Columns:
id | name | user_name | email | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.
```sql
-- (file: spec/seeds_users.sql)
TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (name, user_name, email, password) VALUES ('Harry Potter', 'lightning-boy', 'harry@hogwarts.com', 'scarhead1234');
INSERT INTO users (name, user_name, email, password) VALUES ('Ron Weasley', 'gingernut', 'ron@hogwarts.com', 'redhead4eva');
INSERT INTO users (name, user_name, email, password) VALUES ('Hermione Granger', 'clever-cloggs', 'herminone@hogwarts.com', 'best-in-class');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_database_test < seeds_users.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
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
# Model class
# (in lib/user.rb)
class Student
  attr_accessor :id, :name, :user_name, :email, :password
end

```
## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# Repository class
# (in lib/user_repository.rb)

class StudentRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM users;
    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, user_name, email, password FROM users WHERE id = $1;
    # Returns a single User object.
  end

  def find_by_user_name(user_name)
    # Executes the SQL query:
    # SELECT id, name, user_name, email, password FROM users WHERE user_name = $1;
    # Returns a single User object.
  end

  def create(user)
    # Executes the SQL query; 
    # INSERT INTO users (name, user_name, email, password) VALUES ($1, $2, $3, $4)
    # Returns nil
  end
end
```

## 6. Write Test Examples
```ruby 
# 1
# Get all users
repo = UserRepository.new
users = repo.all

expect(users.length).to eq 3

expect(users[0].id).to eq 1
expect(users[0].name).to eq 'Harry Potter'
expect(users[0].user_name).to eq 'lightning-boy'
expect(users[0].email).to eq 'harry@hogwarts.com'
expect(users[0].password).to eq 'scarhead1234'

expect(users[1].id).to eq 2
expect(users[1].name).to eq 'Ron Weasley'
expect(users[1].user_name).to eq 'gingernut'
expect(users[1].email).to eq 'ron@hogwarts.com'
expect(users[1].password).to eq 'redhead4eva'

expect(users[2].id).to eq 3
expect(users[2].name).to eq 'Hermione Granger'
expect(users[2].user_name).to eq 'clever-cloggs'
expect(users[2].email).to eq 'herminone@hogwarts.com'
expect(users[2].password).to eq 'best-in-class'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

expect(user.id).to eq 1
expect(user.name).to eq 'Harry Potter'
expect(user.user_name).to eq 'lightning-boy'
expect(user.email).to eq 'harry@hogwarts.com'
expect(user.password).to eq 'scarhead1234'

# 3
# Get a single user by its user_name
repo = UserRepository.new

user = repo.find_by_user_name('clever-cloggs')

expect(user.id).to eq 3
expect(user.name).to eq 'Hermione Granger'
expect(user.user_name).to eq 'clever-cloggs'
expect(user.email).to eq 'herminone@hogwarts.com'
expect(user.password).to eq 'best-in-class'

# 4
# Create a new user and adds it to the table
repo = UserRepository.new
new_user = User.new
new_user.name = 'Luna Lovegood'
new_user.user_name = 'loonylovegood'
new_user.email = 'luna@hogwarts.com'
new_user.password = 'hare-raiser'

repo.create(new_user)

expect(repo.all).to include(
  have_attributes(name: 'Luna Lovegood', user_name: 'loonylovegood', email: 'luna@hogwarts.com', password: 'hare-raiser')
)
```
## 7. Reload the SQL seeds before each test run

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_user_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._