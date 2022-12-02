# Messages Model and Repository Classes Design Recipe

_

## 1. Design and create the Table

see: chitter-challenge/design/Database/database_schema_design.md


## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE messages RESTART IDENTITY CASCADE; 
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, email_address, password, full_name) VALUES ('Bloggy_J', 'joe_blogs@gmail.com', 'sxdfhcgjvhk2342','Joe_Bloggs');
INSERT INTO users (username, email_address, password,full_name) VALUES ('The_Migster', 'm_miggins@hotmail.com', '&gfdklwr3', 'Mrs_Miggins');
INSERT INTO users (username, email_address, password,full_name) VALUES ('Schmoe123', 'j_schmoe@gmail.com', '7gyhd88gg4', 'Joe_schmoe');
INSERT INTO users (username, email_address, password,full_name) VALUES ('not_elon', 'Meelon@tesla.com', '1filNfdvc£','Meelon Musk');

INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is a slightly longer peep that I have created', '2022-11-01 14:50:00', '2');
INSERT INTO messages (content, time_posted, user_id) VALUES ('This is a short post', '2022-12-01 19:10:25', '1');
INSERT INTO messages (content, time_posted, user_id) VALUES ('Here is an even longer peep, to deemonstrate how a much longer post may look when stored in my chitter database. Some posts may be even longer!', '2022-07-01 08:10:00', '3');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

```ruby

# Table name: messages

# Model class
# (in lib/message.rb)
class Message
end

# Repository class
# (in lib/student_repository.rb)
class MessageRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: Message

# Model class
# (in lib/message.rb)

class Message

  attr_accessor :id, :content, :time_posted, :user_id
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby

# Table name: messages

# Repository class
# (in lib/message_repository.rb)

class MessageRepository

  # Selecting all records
  # No arguments
  def all
    
    # Returns an array of Message objects.
  end

def sort_messages

  #sorts messages by time in Descending ordering 

  #SELECT content, time_posted, user_id FROM messages
	#ORDER BY time_posted DESC

 

end 

def display 


#returns an array of message objects sorted by time 

# NOTE - this may make all method redundant 

end 

  # Creates a new message
  # Three arguments: content, time_posted, user_id
  def create(message)
    # Executes the SQL query:
    #  sql = 'INSERT INTO messages (content, time_posted, user_id) VALUES($1, $2, $3);'
    #  sql_params = [message.content, message.time_posted, message.user_id]
    # Returns nothing
  end

end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Show messages by time in descending order

repo = MessageRepository.new

sort_messages = repo.sort_messages

timeline = sort_messages.display

timeline.length # =>  3

timeline[0].content # =>  'This is a short post'
timeline[0].time_posted # =>  '2022-12-01 19:10:25'
timeline[0].user_id # => '1'

timeline[0].content # =>  'Here is a slightly longer peep that I have created'
timeline[0].time_posted # =>  '2022-11-01 14:50:00'
timeline[0].user_id # => '2'

# 2
# Create a new message

repo = MessageRepository.new
message = Message.new

message.content = 'This new post should have an older date to test sorting'
message.time_posted =  '2022-09-01 12:37:42'
message.user_id = '2'

sort_messages = repo.sort_messages

timeline = sort_messages.display

timeline.last.content # =>  'This new post should have an older date to test sorting'
timeline.last.time_posted # =>  '2022-09-01 12:37:42'
timeline.last.user_id # => '2'


# 3
# Creates another new message 

repo = MessageRepository.new
message = Message.new

message.content = 'This new post should appear at the top of our timeline'
message.time_posted =  '2022-12-01 11:22:33'
message.user_id = '2'

sort_messages = repo.sort_messages

timeline = sort_messages.display

timeline.first.content # =>  'This new post should appear at the top of our timeline'
timeline.first.time_posted # =>  '2022-12-01 11:22:33'
timeline.first.user_id # => '2'



```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe MessageRepository do
  before(:each) do 
    reset_tables
  end

  it 'shows all messages in reverse chronological order' do 

    repo = MessageRepository.new
    sort_messages = repo.sort_messages
    timeline = sort_messages.display
    
    expect(timeline.length).to eq 3

    expect(timeline[0].content).to eq 'This is a short post'
    expect(timeline[0].time_posted).to eq '2022-12-01 19:10:25'
    expect(timeline[0].user_id).to eq '1'

    expect(timeline[0].content).to eq 'Here is a slightly longer peep that I have created'
    expect(timeline[0].time_posted).to eq '2022-11-01 14:50:00'
    expect(timeline[0].user_id).to eq '2'
  
  end 

  it 'creates a new message' do

    repo = MessageRepository.new
    message = Message.new

    message.content = 'This new post should have an older date to test sorting'
    message.time_posted =  '2022-09-01 12:37:42'
    message.user_id = '2'

    sort_messages = repo.sort_messages
    timeline = sort_messages.display

    expect(timeline.last.content).to eq 'This new post should have an older date to test sorting'
    expect(timeline.last.time_posted).to eq '2022-09-01 12:37:42'
    expect(timeline.last.user_id).to eq '2'


  end 


end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._