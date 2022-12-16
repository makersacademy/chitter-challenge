require_relative 'message'

class MessageRepository
  def all
    # Executes the SQL query:

    sql = 'SELECT messages.id as id, messages.message AS message, messages.time AS time, people.handle AS handle FROM messages JOIN people ON messages.person_id = people.id ORDER BY time DESC';
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
    params = [message.message, message.person_id]

    result_set = DatabaseConnection.exec_params(sql, params)
  end
end
