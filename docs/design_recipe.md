{{TABLE NAME}} Model and Repository Classes Design Recipe

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

Nouns:

peep_content, peep_post_time, user_name, user_email

1. Design and create the Table

DB name: chitterdb_test

Table: peeps
Table: users

Columns:
id | peep_content | peep_post_time | user_id
id | user_name | user_email

2. Create Test SQL seeds

-- (file: spec/seeds_peeps_test.sql)

TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('First peep', '2023-03-12', 1);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Second peep', '2023-03-13', 2);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Third peep', '2023-03-14', 1);
INSERT INTO peeps (peep_content, peep_post_time, user_id) VALUES ('Fourth peep', '2023-03-12', 3);

INSERT INTO users (user_name, user_email) VALUES ('User 1', 'user1@peep.com');
INSERT INTO users (user_name, user_email) VALUES ('User 2', 'user2@peep.com');
INSERT INTO users (user_name, user_email) VALUES ('User 3', 'user3@peep.com');

Run once to create the tables (for each DB):
    CREATE TABLE users (
        id SERIAL,
        user_name TEXT,
        user_email TEXT
    );
    
    CREATE TABLE peeps (
        id SERIAL,
        peep_content TEXT,
        peep_post_time TIMESTAMP,
        user_id INT,
        constraint fk_user foreign key(user_id) references users(id) on delete cascade
    );

-- creating the tables first then feeding the seeds file to the database (including the pk constraint)

Then load the test seeds into the test database
    psql -h 127.0.0.1  chitterdb_test < seeds_peeps_test.sql

3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class Student
end

# Repository class
# (in lib/student_repository.rb)
class StudentRepository
end

4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

class Student

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cohort_name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name

You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.
5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class StudentRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end

6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

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

Encode this example as a test.
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