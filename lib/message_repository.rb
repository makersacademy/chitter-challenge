require_relative 'database_connection'
require_relative 'message'
require_relative 'message_and_author'

class MessageRepository
    def all

      sql = 'SELECT id, message, date, author_id FROM messages;'
      result_set = DatabaseConnection.exec_params(sql,[])

      all_messages = []

      result_set.each do |result|
        message = Message.new
        message.message = result['message']
        message.date = result['date']
        message.author_id = result['author_id']

        all_messages << message
      end
      return all_messages
      # Returns an array of Message objects.
    end
  
    def create(message)
      # Executes the SQL query:
      sql = "INSERT INTO messages (message, date, author_id) VALUES ($1,$2,$3);"
      sql_params = [message.message,message.date,message.author_id]
      DatabaseConnection.exec_params(sql,sql_params)
    end
  
    def messages_with_authors()
      # Executes the SQL query:
      sql = 'SELECT messages.message,messages.date,users.name AS author_name FROM messages JOIN users ON users.id = messages.author_id;'
      result_set = DatabaseConnection.exec_params(sql,[])

      messages_with_authors = []

      result_set.each do |result|
        message_and_author = MessageAndAuthor.new
        message_and_author.message = result['message']
        message_and_author.date = result['date']
        message_and_author.author = result['author_name']
        
        messages_with_authors << message_and_author
      end
      return messages_with_authors
    end
    
  end