# User Model and Repository Classes Design Recipe

## 1. Test SQL seeds

```sql
-- (file: spec/seeds_user.sql)

TRUNCATE TABLE users RESTART IDENTITY;

--NOTE: Password will be encrypted using hash algoritm SHA-256
INSERT INTO users (name, username, password, email)
VALUES ('John Doe', 'johndoe', 'password123', 'johndoe@example.com'),
('Jane Smith', 'janesmith', 'abc123', 'janesmith@example.com'),
('Bob Johnson', 'bobj', 'def456', 'bobj@example.com');
```


```bash
psql -h 127.0.0.1 your_database_name < seeds_users.sql
```

## 2. Class names

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
```

## 3. Model class

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :name, :username, :password, :email
end
```

## 4. Repository Class interface

```ruby
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class StudentRepository
  def add_user(user)
    # Encrypts password
    # Executes sql: (where password is encrypted)
    # INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);
    
    # Returns nothing
  end

  def authenticate(username, password)
    # Executes sql: 
    # SELECT password FROM users WHERE username = $1;
    # checks encrypted password against inputted password when user attempts to log in
    # returns boolean
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  def delete(user)
    # Executes the SQL query:
    # DELETE FROM users WHERE id = $1 

    # returns nothing
  end
end
```

## 5. Test Examples


```ruby
# EXAMPLES

# 1
# Get add new user

repo = UserRepository.new

user = User.new
user.id = 4
user.name = 'Janie Marie'
user.username = 'JMarie1'
user.password = 'foo'
user.email = 'Jmarie2002@example.com'

repo.add_user(user)

repo.find(4) # => user

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # => 1
user.name # => 'John Doe'
user.username # => 'johndoe'
user.password # => 'password123'
user.email # => johndoe@example.com'

# 3 
# Authenticate user
repo = UserRepository.new

repo.authenticate('johndoe', 'password123') # => true
repo.authenticate('johndoe', 'password1234') # => false

```

## 6. Reset SQL seeds before each test run

```ruby
# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_user.sql')
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
