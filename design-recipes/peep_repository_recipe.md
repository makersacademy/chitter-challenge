 # Peeps Model and Repository Classes Design Recipe

 _Copy this recipe template to design and implement Model and Repository classes for a database table._

 ## 1. Design and create the Table
 
 *Already created
 
 ## 2. Create Test SQL seeds
 
 Seed data created
 
 Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.
 
 ```bash
 psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
 ```
 
 ## 3. Define the class names
 
 Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.
 
 ```ruby
 
 # Model class
 # (in lib/peep.rb)
 class Peep
 end
 
 # Repository class
 # (in lib/peep_repository.rb)
 class PeepRepository
 end
 ```
 
 ## 4. Implement the Model class
 
 Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.
 
 ```ruby
 
 class Peep
   attr_accessor :id, :content, :time, :user_id
 end
 
 ```
 
 *You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*
 
 ## 5. Define the Repository Class interface
 
 Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.
 
 Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.
 
 ```ruby
 # Repository class
 # (in lib/peep_repository.rb)
 
 class PeepRepository
 
   # Selecting all records
   # No arguments
   def all
     # Executes the SQL query:
     # SELECT id, content, time, user_id FROM peeps;
 
     # Returns an array of Peep content and time objects with User objects of name and username using associated user_id
     # Orders Peep objects in reverse chronological order
   end
 
  # Inserts a new peep record
   # Takes new Peep object
   def create(peep)
   # INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3);
   # Not return anything, just creates
   end
 end
 ```
 
 ## 6. Write Test Examples
 
 Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.
 
 These examples will later be encoded as RSpec tests.
 
 ```ruby
 
 # 1
 # Get all peeps
 
 repo = PeepRepository.new
 
 peeps = repo.all
 peeps.length # => 2
 peeps.first # => '1'
 peeps.first.content # => 'First Peep!'
 
 # 4
 # Creates a new peep
 
 repo = PeepRepository.new
 
 peep = Peep.new
 peep.content = 'Hello World'
 peep.time = 'Time.now'
 peep.user_id = '1'
 
 repo.create(peep) # => nil
 
 peep = repo.all
 
 last_peep = peep.last
 last_peep.content # => 'Hello World'
 last_peep.user_id # => '1'
 ```
 
 Encode this example as a test.
 
 ## 7. Reload the SQL seeds before each test run
 
 Running the SQL code present in the seed file will empty the table and re-insert the seed data.
 
 This is so you get a fresh table contents every time you run the test suite.
 
 ```ruby
 # EXAMPLE
 
 # file: spec/peep_repository_spec.rb
 
 def reset_peeps_table
   seed_sql = File.read('spec/chitter_seeds.sql')
   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
   connection.exec(seed_sql)
 end
 
 describe PeepRepository do
   before(:each) do 
     reset_peeps_table
   end
 
   # (your tests will go here).
 end
 ```
 
 ## 8. Test-drive and implement the Repository class behaviour
 
 _After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._