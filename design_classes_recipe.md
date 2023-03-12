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
  # def all
    # Executes the SQL query:
    # sql = 'SELECT id, email, password, name, username FROM peeps;'

    # Returns an array of Peep objects.
  # end

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
# Get all peeps
repo = PeepRepository.new
peeps = repo.all
peeps.length # =>  2

peeps[0].id # =>  1
peeps[0].content # =>  'Content1'
peeps[0].time # =>  '2023-02-14 10:27:15'
peeps[0].maker_id # => 1

peeps[1].id # =>  2
peeps[1].content # =>  'Content2'
peeps[1].time # =>  '2023-02-14 11:27:15'
peeps[1].maker_id # => 2

# 2
# Create a peep
repo = PeepRepository.new

new_peep = Peep.new
new_peep.content = 'Content3'
new_peep.time = '2023-02-15 12:27:15'
new_peep.maker_id = 1
repo.create(new_peep)

peeps = repo.all

expect(peeps.last.content).to eq('Content3')
expect(peeps.last.time).to eq('2023-02-15 12:27:15')
expect(peeps.last.maker_id).to eq(1)

# 3
# Create a maker
repo = MakerRepository.new

new_maker = Maker.new
new_maker.email = 'maker3@mail.com'
new_maker.password = '12345678'
new_maker.name = 'maker3'
new_maker.username = 'username3'

repo.create(new_maker)

(new_maker.email)# =>('maker3@mail.com')
(new_maker.password)# =>('12345678')
(new_maker.name)# =>('maker3')
(new_maker.username)# =>('username3')

# 4
# Find a single maker

repo = MakerRepository.new

maker = repo.find(1)

maker.id # => 1
maker.email # => 'maker1@mail.com'
maker.password # => '12345678'
maker.name # => 'maker1'
maker.username # => 'username1'


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (your tests will go here).

# file: spec/maker_repository_spec.rb

def reset_makers_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

describe MakerRepository do
  before(:each) do 
    reset_makers_table
  end
end
8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

