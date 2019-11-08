class Messages
    def self.return_messages
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("SELECT * FROM messages;")
        result.map { |message| message['messages'] }
    end
end