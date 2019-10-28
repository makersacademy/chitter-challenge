require 'pg'

class Messages
    attr_reader :message 

    def initialize(message:)
        @message = message
    end

    def self.create(message:)
        connection = PG.connect(dbname: "chitter_challenge")
        connection.exec("INSERT INTO messages (message) VALUES('#{message}')")
    end

    def self.list
        connection = PG.connect(dbname: "chitter_challenge")
        message = connection.exec('SELECT * FROM messages;')

        message.map { |msg| msg['message']} #this cycles through all msges
    end

end