require 'pg'

class Chitter
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end 
    
        result = connection.exec("SELECT * FROM chitter_messages;")
        result.map { |peep| peep['message'] }
    end 

    def self.post(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end 

        connection.exec("INSERT INTO chitter_messages (message) VALUES('#{message}')")
    end 
end
