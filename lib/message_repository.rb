require_relative 'message'

class MessageRepository
  def all
    # messages = []

    # # Send the SQL query and get the result set.
    # sql = 'SELECT time, date, content FROM messages;'
    # result_set = DatabaseConnection.exec_params(sql, [])
    message = Message.new
    second_message = Message.new
    message.time = '12:09:00'
    message.date = '2023-04-13'
    message.content = 'Hello, world'
    second_message.time = '10:15:00'
    second_message.date = '2023-04-09'
    second_message.content = 'Ruby rules'
    return [message]
  end
        
#     # The result set is an array of hashes.
#     # Loop through it to create a model
#     # object for each record hash.
#     result_set.each do |peep|
    
#     # Create a new model object with the record data.
#       message = Message.new
#       # message.id = peep['id'].to_i
#       message.time = peep['time']
#       message.date = peep['date']
#       message.content = peep['content']
    
#       messages << message
#     end
#     return messages
#   end

#   def create(message)
#     return message
#   end
# end
    
#   def find(id)
#     sql = 'SELECT id, time, date, content FROM messages WHERE id = $1;'
#     result_set = DatabaseConnection.exec_params(sql, [id])
    
#     result_set.each do |peep| 
#     p peep
#     end
    
#     album = Album.new
#     message = Message.new
#     message.id = peep[0]['id'].to_i
#     message.time = peep[0]['time']
#     message.date = peep[0]['date']
#     message.content = peep[0]['content']
    
#     return message
#   end
    
#   def create(album)
#     sql = 'INSERT INTO messages (time, date, content) VALUES ($1, $2, $3);'
#     result_set = DatabaseConnection.exec_params(sql, [message.time, message.date, message.content ])
    
#     return message
#   end
    
#   def delete(id)
#     sql = 'DELETE FROM messages WHERE id = $1;';
#     DatabaseConnection.exec_params(sql, [id]);
#   end
end