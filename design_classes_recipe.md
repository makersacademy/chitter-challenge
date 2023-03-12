Chitter-challenge Model and Repository Classes Design Recipe

1. Design and create the Table
If the table is already created in the database, you can skip this step.

2. Create Test SQL seeds
If they are already created, you can skip this step.

3. Define the class names
# Table name: peeps
# Model class
# (in lib/peep.rb)
class Peep
end

# Table name: makers
# Model class
# (in lib/maker.rb)
class Maker
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end

# Repository class
# (in lib/maker_repository.rb)
class MakerRepository
end

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# Table name: peeps
# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :content, :time, :maker_id
end

# Table name: makers
# Model class
# (in lib/maker.rb)

class Maker
  attr_accessor :id, :email, :password, :name, :username
end

5. Define the Repository Class interface
# Table name: peeps
# Repository class
# (in lib/peep_repository.rb)

class PeepRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # sql = 'SELECT id, email, password, name, username FROM peeps;'

    # Returns an array of Peep objects.
  end

  # def create(peep)
    # Executes the SQL query:
    # sql = 'INSERT INTO peeps (content, time, maker_id) VALUES ($1, $2, $3);'
    # DatabaseConnection.exec_params(sql, [peep.content, peep.time, peep.maker_id])

    # it does not return anything
  # end
end

# Table name: makers
# Repository class
# (in lib/maker_repository.rb)

class MakerRepository

  # def create(maker)
    # Executes the SQL query:
    # sql = 'INSERT INTO makers (email, password, name, username) VALUES ($1, $2, $3, $4);'
    # DatabaseConnection.exec_params(sql, [maker.email, maker.password, maker.name, maker.username])

    # it does not return anything
  # end

  # def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, email, password, name, username FROM makers WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    returns a a maker or an error if it's not found
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

