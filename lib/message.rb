# require './lib/database_connection.rb'

# class Message

#   def self.create(text:)
#     message = DatabaseConnection.query("INSERT INTO messages(message) VALUES('#{text}') RETURNING id, message, time;")
#     Message.new(id: message[0]['id'], text: message[0]['message'], time: message[0]['time'])
#   end

#   def self.all
#     messages = DatabaseConnection.query("SELECT * FROM messages;")
#     messages.map do |row| Message.new(id: row['id'], text: row['message'], time: row['time']) end
#   end

#   attr_reader :id, :text, :time

#   def initialize(id:, text:, time:)
#     @id = id
#     @text = text
#     @time = time
#   end
# end
