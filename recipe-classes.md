What will we need?
We will need a class:
to show the peeps
to add peeps

class Message
    attr_accessor :id, :message, :date, :author_id
end

class MessageAndAuthor
    attr_accessor :message, :date, :author
end

class MessageRepository
  def all
    # Executes the SQL query:
    # SELECT id, message, date, author_id FROM messages;

    # Returns an array of Message objects.
  end

  def create(message)
    # Executes the SQL query:
    INSERT INTO messages (message, date, author_id) VALUES ($1,$2,$3);
    returns nothing
  end

  def messages_with_authors()
    # Executes the SQL query:
    SELECT messages.message,messages.date,users.name AS author_name FROM messages JOIN users ON users.id = messages.author_id;

    returns an array of MessagesAndAuthor
  end

end

Tests Examples:
# 1
repo = MessageRepository.new
all_messages = repo.all

all_messages.length # => 3
all_messages[1].message # => 'It is too hot today'
all_messages[1].date #=> '2022-11-07 00:00:00'
all_messages[1].author_id #=> '2'


repo = MessageRepository.new
messages_with_authors = repo.messages_with_authors
messages_with_authors[0].message #=> 'I had a tasty salad'
messages_with_authors[0].date #=> '2022-07-14 00:00:00'
messages_with_authors[0].author #=> 'Irina'

repo = MessageRepository.new
messages_with_authors = repo.messages_with_authors
messages_with_authors[2].message #=> 'We need to go to the beach'
messages_with_authors[2].date #=> '2022-11-07 00:00:00'
messages_with_authors[2].author #=> 'Julien'

repo = MessageRepository.new
message = Message.new
message.message = 'Test message'
message.date = '2022-07-10'
message.author_id = 1
repo.create(message)

all_messages = repo.all
last_message = all_messages.last
last_message.message #=> 'Test message'
last_message.date #=> '2022-07-10 00:00:00'
last_message.author_id #=> '1'