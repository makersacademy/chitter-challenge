# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table
```
Table: peeps

Columns:
id | content | timestamp | name | username
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/test_seeds.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username) VALUES ('Now I know how lobsters feel :-(', '2022-13-08 12:00:00', 'Alex', 'iloveanimals391');
INSERT INTO peeps (content, timestamp, name, username) VALUES ('Just call me the man with a fan!', '2022-13-08 13:00:00', 'Zeus', 'technoraver99');
```

## 3. Define the class names

```ruby

Model class
in lib/peep.rb)
class Peep
end

Repository class
in lib/peep_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

```ruby

Model class
in lib/peep.rb)

class Peep

  attr_accessor :id, :content, :timestamp, :name, :username
end
```

## 5. Define the Repository Class interface

```ruby

class PeepRepository

  # Shows all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps;

    # Returns an array of Peep objects.
  end

  # Post new peep
  # Takes a peep object as argument
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ($1, $2, $3, $4, $5);'

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

