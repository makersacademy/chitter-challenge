social Network Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Define the tables

Table 1: people

Columns:
id | name | handle | email | password

Table 2: messages

Columns: 
id | message | person_id | time 


2. Create Test SQL seeds

TRUNCATE TABLE people RESTART IDENTITY CASCADE;
TRUNCATE TABLE messages RESTART IDENTITY; 

INSERT INTO people (name, handle, email, password) VALUES ('Johnny', 'singStar', 'johnny@sing2.com', 'A');
INSERT INTO people (name, handle, email, password) VALUES ('Rossita', 'singForever', 'rossita@sing2.com', 'B');
INSERT INTO people (name, handle, email, password) VALUES ('Moon', 'singHero', 'singHero@sing2.com', 'C');

INSERT INTO messages (message, person_id, time) VALUES ('Who''s still meeting for lunch and what shall we go?', 1, '2022-09-01 11:03:01');
INSERT INTO messages (message, person_id, time) VALUES ('Yep I''m coming!', 3, '2022-09-01 11:05:01');
INSERT INTO messages (message, person_id, time) VALUES ('How about Franca Manco?', 3, '2022-09-01 11:02:30');
INSERT INTO messages (message, person_id, time) VALUES ('Sorry guys I can''t make it', 2, '2022-09-01 11:15:01');
INSERT INTO messages (message, person_id, time) VALUES ('Shame to miss you Rossita, see you later Moon', 1, '2022-09-01 11:16:45');

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql



3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

Table name: people

Model classes
(in lib/person.rb)
class Person
end

Model PersonRepository
(in lib/person_repository.rb)
class PersonRepository
end

(in lib/message.rb)
class Message
end

Repository classes
(in lib/message_repository.rb)
class MessageRepository
end


4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

Table name: person

Model class
(in lib/person.rb)

class Person
  attr_accessor :id, :name, :handle, :email, :password
end

Table name: message

Model class
(in lib/message.rb)
class Message
  attr_accessor :id, :message, :person_id, :time)
end

5. Define the Repository Class interface


Table name: people

Repository class
(in lib/person_repository.rb)

class UserRepository

  # not sure what is needed here as the exercise is primarily concerned with messages


class MessageRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:

    sql = 'SELECT messages.message AS message, messages.time AS time, people.handle AS handle FROM messages JOIN people ON messages.person_id = people.id ORDER BY time DESC;
    result_set = DatabaseConnection.exec_params(sql, [])
    
    messages = []

    result_set.each do |record|
      message = Message.new
      message.id = record['id']
      message.message = record['message']
      message.time = record['time']
      message.handle = record['handle']
    

      messages << message
    end

    return messages
  end

  def create(message)
    sql = 'INSERT INTO messages (message, person_id) VALUES ($1, $2);'
    params = [message.message, message.person_id, message.time]

    result_set = DatabaseConnection.exec_params(sql, params)
  end

  <!-- def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end -->

end
6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all messages

repo = MessageRepository.new

messages = repo.all

messages.length # =>  3

message[0].id # =>  1
message[0].message # =>  'Who\'s still meeting for lunch and what shall we go?'
message[0].time # => '2022-09-01 11:16:45'
message[0].handle # =>  'singStar'

message[0].id # =>  2
message[0].message # =>  'Sorry guys I can\t make it'
message[0].time # => '2022-09-01 11:15:01'
message[0].handle # =>  'singForever'


# 2 create a new message

repo = MessageRepository.new

new_user = User.new
new_user.username = 'Postman Pat'
new_user.email = 'patandcat@hillsmail.com'

query = repo.create(new_user)

users = repo.all

users.length => 3

# 4 delete a user

repo = UserRepository.new

repo.delete(1)

users = repo.all

users.length => 1


7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BooksRepository do
  before(:each) do 
    reset_books_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.