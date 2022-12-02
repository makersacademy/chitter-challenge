require_relative 'message'

class MessageRepository

  def initialize 

    @all_messages = []

  end

  def sort_messages

    sql = 'SELECT id, content, time_posted, user_id FROM messages
    ORDER BY time_posted DESC'

    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      @all_messages << record_to_message_object(record)

    end 
  end 

  def create(message)
    sql = 'INSERT INTO messages (content, time_posted, user_id) VALUES($1, $2, $3);'
    sql_params = [message.content, message.time_posted, message.user_id]
    
    DatabaseConnection.exec_params(sql,sql_params)
  
  end

  def display

    return @all_messages

  end 



  private

  def record_to_message_object(record)
    message = Message.new
    message.id = record['id']
    message.content = record['content']
    message.time_posted = record['time_posted']
    message.user_id = record['user_id']

    return message
  end
end 