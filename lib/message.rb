require 'pg'

class Message
    attr_reader :id, :text, :time, :user

    def initialize(id:, text:, time:, user:)
        @id = id
        @text = text
        @time = time
        @user = user
    end

    def self.create(user_id, text, time)
        connection = connect
        connection.exec("INSERT INTO messages (user_id, text, time) VALUES ($1, $2, $3);", [user_id, text, time])
    end

    def self.all 
        connection = connect
        result = connection.exec("SELECT * from messages")
        result.map do |message|
            Message.new(id: message['id'], 
                        text: message['text'], 
                        time: message['time'], 
                        user: connection.exec("SELECT email from users where id = $1;", [message['user_id']]).first['email']
            )
        end
    end

    private

    def self.connect
        db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
        return PG.connect(dbname: db_name) 
    end
end