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

INSERT INTO users (name, email, username, password) VALUES ('Alex', 'alexemail@test.com', 'iloveanimals391', 'password123')
INSERT INTO users (name, email, username, password) VALUES ('Zeus', 'zeusemail@test.com', 'habanerohotstuff', 'password123')
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

  # Creates a new user
  # Takes a user object as argument
  def create(new_user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'

    # Doesn't return anything
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all students

repo = StudentRepository.new

students = repo.all

students.length # =>  2

students[0].id # =>  1
students[0].name # =>  'David'
students[0].cohort_name # =>  'April 2022'

students[1].id # =>  2
students[1].name # =>  'Anna'
students[1].cohort_name # =>  'May 2022'

# 2
# Get a single student

repo = StudentRepository.new

student = repo.find(1)

student.id # =>  1
student.name # =>  'David'
student.cohort_name # =>  'April 2022'

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

