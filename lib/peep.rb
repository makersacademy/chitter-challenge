require 'pg'

class Peep
    def self.all
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec('SELECT * FROM peeps;')
        result.map { |peep| peep['message'] }
    end

    def self.post(message:)
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
        # Peep.new
    end   
end