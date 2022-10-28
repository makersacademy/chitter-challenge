

2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_messages.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO messages (content, time_date, user_id) VALUES ('My first Peep', '2022-10-26T13:42:38+01:00', '1');
INSERT INTO messages (content, time_date, user_id) VALUES ('This is MY first Peep', '2022-10-26T14:04:57+01:00', '2');

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql


4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: messages

# Model class
# (in lib/message.rb)

class Message

  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time_date, user_id
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
# Table name: messages

# Repository class
# (in lib/message_repository.rb)

class MessageRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM messages;

    # Returns an array of Message objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, time_date, user_id FROM messages WHERE id = $1;

    # Returns a single Message object.
  end

  def create(message)
    # Executes the SQL query:
    # INSERT INTO messages content, time_date, user_id VALUES ($1, $2, $3);
  end

end

6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all messages

repo = MessageRepository.new

messages = repo.all

messages.length # =>  2

messages[0].id # =>  '1'
messages[0].content # =>  'My first Peep'
messages[0].time_date # =>  '2022-10-26T13:42:38+01:00'
messages[0].user_id # => '1'

messages[1].id # =>  '2'
messages[1].content # =>  'This is MY first Peep'
messages[1].time_date # =>  '2022-10-26T14:04:57+01:00'
messages[1].user_id # => '2'

# 2
# Get a single message

repo = MessageRepository.new

message = repo.find(1)

messages.id # =>  '1'
messages.content # =>  'My first Peep'
messages.time_date # =>  '2022-10-26T13:42:38+01:00'
messages.user_id # => '1'

# 3
# Create a message

repo = MessageRepository.new

message = Message.new
message.content = 'Testing a Peep'
message.time_date = '2022-10-26T17:12:06+01:00'
message.user_id = 1

repo.create(message)

messages = repo.all

messages.last.id # => '3'
messages.last.content # => 'Testing a Peep'
messages.last.time_date # => '2022-10-26T17:12:06+01:00'
messages.last.user_id # => '1'


# Add more examples for each method

Encode this example as a test.
7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_messages_table
  seed_sql = File.read('spec/seeds_messages.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe MessageRepository do
  before(:each) do 
    reset_messages_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.