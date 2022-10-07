Peep Model and Repository Classes Design Recipe

1. Design and create the Table

DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message text,
    tag text,
    time date,
    user_id int4
);

TRUNCATE TABLE peeps RESTART IDENTITY;

2. Create Test SQL seeds

-- (file: spec/peep_seeds.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "tag", "time", "user_id") VALUES
('Nice weather this morning!', 'Miles', '2004-10-19 10:30', 1),
('Love this song!', 'Miles', '2001-01-14 08:45', 1);

psql -h 127.0.0.1 peeps_test < peep_seeds.sql

3. Define the class names

Table name: peeps

Model class # (in lib/peep.rb)

class Peep
end

Repository class # (in lib/peep_repository.rb)

class PeepRepository
end

4. Implement the Model class

Table name: peeps

Model class # (in lib/peep.rb)

class Peep

  attr_accessor :message, :tag, :time, :user_id
end


5. Define the Repository Class interface

Table name: peeps

# Repository class (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT message, tag, time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # finding one record with id as argument
  def find(id)
    # Executes the SQL query:
    # SELECT message, tag, time, user_id FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # inserting a new record with instance of Peep class as argument
  def create(post)
    # Executes the SQL query:
    # INSERT INTO peeps (message, tag, time, user_id) VALUES ($1, $2, $3, $4)
    # Returns nothing.
  end
end


6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# 1
# gets all peeps

repo = PeepRepository.new

peeps = repo.all
peeps.length # =>  2
peeps[0].message # => 'Nice weather this morning!'
peeps[0].tag # => 'Miles'
peeps[0].time # => '2004-10-19 10:30'
peeps[0].user_id # => '1'

# 2
# finds a peep

repo = PeepRepository.new

peep = repo.find(2)
peep.message # => 'Love this song!'
peep.tag # => 'Miles'
peep.time # => '2001-01-14 08:45'
peep.user_id # => '1'

# 3
# Create a new peep

repo = PeepRepository.new
new_peep = Peep.new
new_peep.message = 'Hello, world!'
new_peep.tag = ''
new_peep.time = '2022-01-01 12:00'
new_peep.user_id = '1'
    
repo.create(new_peep) # => nil

peeps = repo.all
last_peep = peeps.last
last_peep.message # => 'Hello, world!'
last_peep.tag # => ''
last_peep.time # => '2022-01-01 12:00'
last_peep.user_id # => '1'

7. Reload the SQL seeds before each test run

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/peep_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  # (tests will go here).
end


8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.