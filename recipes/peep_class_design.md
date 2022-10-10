Peep Model and Repository Classes Design Recipe

1. Design and create the Table

DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message text,
    tag text,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    user_id int
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email text,
    password text
);

2. Create Test SQL seeds

-- (file: spec/peep_seeds.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "tag", "created_at") VALUES
('Nice weather this morning!', 'Miles', '2004-10-19 10:30'),
('Love this song!', 'Miles', '2001-01-14 08:45');

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

  attr_accessor :message, :tag, :created_at
end


5. Define the Repository Class interface

Table name: peeps

# Repository class (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT message, tag, created_at FROM peeps;

    # Returns an array of Peep objects.
  end

  # finding one record with id as argument
  def find(id)
    # Executes the SQL query:
    # SELECT message, tag, created_at FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  # inserting a new record with instance of Peep class as argument
  def create(post)
    # Executes the SQL query:
    # INSERT INTO peeps (message, tag, created_at) VALUES ($1, $2, $3)
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
peeps[0].created_at # => '2004-10-19 10:30:00'

# 2
# finds a peep

repo = PeepRepository.new

peep = repo.find(2)
peep.message # => 'Love this song!'
peep.tag # => 'Miles'
peep.created_at # => '2001-01-14 08:45:00'

# 3
# Create a new peep

repo = PeepRepository.new
new_peep = Peep.new
new_peep.message = 'Hello, world!'
new_peep.tag = ''
new_peep.created_at = '2022-01-01 12:00:00'
    
repo.create(new_peep) # => nil

peeps = repo.all
last_peep = peeps.last
last_peep.message # => 'Hello, world!'
last_peep.tag # => ''
last_peep.created_at # => '2022-01-01 12:00:00'

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