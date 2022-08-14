# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table
```
Table: users

Columns:
id | name | email | username | password
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/test_seeds.sql)

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (name, email, username, password) VALUES ('Alex', 'alexemail@test.com', 'iloveanimals391', 'alexpassword')
INSERT INTO users (name, email, username, password) VALUES ('Zeus', 'zeusemail@test.com', 'habanerohotstuff', 'zeuspassword')
```

## 3. Define the class names

```ruby

Model class
in lib/users.rb)
class User
end

Repository class
in lib/user_repository.rb)
class UserRepository
end
```

## 4. Implement the Model class

```ruby

Model class
in lib/user.rb)

class User
  attr_accessor :id, :name, :email, :username, :password
end
```

## 5. Define the Repository Class interface

```ruby

class UserRepository

  # Shows all users
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns an array of User objects.
  end

  # Creates a new user
  # Takes a user object as argument
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'

    # Doesn't return anything
  end

  # Search for user by email
  # Takes email argument
  def find_by_email(email)
    # Executes the SQL query:
    # 'SELECT * FROM users WHERE email = $1;'
    
    # Returns user object
  end

  # Logs in user (if email and password_attempt arguments are correct)
  def log_in(email, password_attempt)
    # EXECUTES the SQL query:
    # Calls find_by_email method and assigns new user variable
    # If user password matches encrypted password_attempt, log in successful
  end
end
```

## 6. Write Test Examples

```ruby
# EXAMPLES

# 1.
# Shows all users

repo = UserRepository.new
users = repo.all

expect(users.length).to eq(2)
expect(users.first.name).to eq('Alex')

expect(users.last.name).to eq('Zeus')

# 2.
# Create a new user

repo = UserRepository.new
new_user = User.new

new_user.name = 'Max'
new_user.email = 'maxemail@test.com'
new_user.username = 'maxonthesax'
new_user.password = 'maxpassword'

repo.create(new_user)

users = repo.all
last_user = users.last

expect(last_user.name).to eq 'Max'
expect(last_user.email).to eq 'maxemail@test.com'
expect(last_user.username).to eq 'maxonthesax'
expect(last_user.password).to eq 'maxpassword'

# 3.
# Search for user by email

# 4.
# Logs in user

```
## 7. Reload the SQL seeds before each test run

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_users_table
  end
```

## 8. Test-drive and implement the Repository class behaviour

