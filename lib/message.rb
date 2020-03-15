require_relative './database_connection'

class Message

    attr_reader :id, :user_id, :time, :content

    def initialize(id:, user_id:, time:, content:)
        @id = id
        @user_id = user_id
        @time = time
        @content = content
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM messages")

        result.map{ |message|
            Message.new(id: message['id'], user_id: message['user_id'], time: message['time'], content: message['content'])
        }
    end

    def self.create(user_id:, time:, content:)
        result = DatabaseConnection.query("INSERT INTO messages (user_id, time, content) VALUES('#{user_id}', '#{time}', '#{content}') RETURNING id, user_id, time, content;")
        Message.new(id: result[0]['id'], user_id: result[0]['user_id'], time: result[0]['time'], content: result[0]['content'])
    end
end