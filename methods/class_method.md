# **Chitter Model and Repository Classes Design Recipe**

## **1. Design and create the Table**
See chitter_table.sql

## **2. Create Test SQL seeds**

-- (file: spec/seeds_users.sql)

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (name, username, email, password) VALUES ('David Jones', 'Jonesy41', 'dave@chittermail.com', 'davelovescats');
INSERT INTO users (name, username, email, password) VALUES ('Katy Smith', 'KatieKat', 'kate@chittermail.com', '1234');
INSERT INTO users (name, username, email, password) VALUES ('Lauren Brown', 'Lilauren', 'lauren@chittermail.com', 'laurenspassword');
INSERT INTO users (name, username, email, password) VALUES ('Will Smith', 'Smithy', 'will@chittermail.com', 'will43');
INSERT INTO users (name, username, email, password) VALUES ('Megan Herbert', 'Megs', 'meg@chittermail.com', 'meglikesdogs');

-- (file: spec/seeds_peeps.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (title, content, time, user_id) VALUES ('Cats', 'I love them!!!!', 14:28, 1);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Dogs', 'The best!!!!', 00:18, 3);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Animals', 'Couldn't care less', 09:14, 5);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Pigs', 'So cute', 11:58, 1);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Trains', 'Who has questions?', 16:54, 2);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Shopping', 'Who wants to see what I bought?', 19:28, 4);
INSERT INTO peeps (title, content, time, user_id) VALUES ('Shopping Part 2', 'Who wants to see what I bought?', 20:37, 4);

## **3. Define the class names**

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

## **4. Implement the Model class**

# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :name, :username, :email, :password
end

# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :title, :content, :time, :user_id
end


*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## **5. Define the Repository Class interface**

# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  def all
    SELECT id, name, username, email, password FROM users;

    # Returns an array of User objects.
  end

  # Creates a new user
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users(id, name, username, email, password) VALUES ($1, $2, $3, $4);

    # creates a new User object.
  end
end

# Table name: users

# Repository class
# (in lib/user_repository.rb)

class PeepRepository

  def all
    SELECT id, title, content, time, user_id FROM peeps;

    # Returns an array of User objects.
  end

  # Creates a new peep
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps(id, title, content, time, user_id) VALUES ($1, $2, $3, $4);

    # creates a new Peep object.
  end
end


## **6. Write Test Examples**

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

`# EXAMPLES

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

# Add more examples for each method`

Encode this example as a test.

## **7. Reload the SQL seeds before each test run**

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

`# EXAMPLE

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
end`

## **8. Test-drive and implement the Repository class behaviour**

*After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.*