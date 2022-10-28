require_relative 'message'
require_relative 'database_connection'

class MessageRepository
  def inflate(results)
    messages = []
    results.each do |result|
      message = Message.new
      message.id = result['id']
      message.content = result['content']
      message.time_date = result['time_date']
      message.user_id = result['user_id']
      messages << message
    end
    return messages
  end

  def all
    messages = []
    # Executes the SQL query:
    sql = 'SELECT * FROM messages;'
    results = DatabaseConnection.exec_params(sql, [])
    messages = inflate(results)
    # Returns an array of Message objects.
    return messages
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, content, time_date, user_id FROM messages WHERE id = $1;'
    results = DatabaseConnection.exec_params(sql, [id])
    message = inflate(results)[0]

    # Returns a single Message object.
    return message
  end

  def create(message)
    # Executes the SQL query:
    sql = 'INSERT INTO messages (content, time_date, user_id) VALUES ($1, $2, $3);'
    params = [message.content, message.time_date, message.user_id]
    DatabaseConnection.exec_params(sql, params)
  end
end
