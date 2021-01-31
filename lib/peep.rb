require 'pg'

class Peep
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
          else
            connection = PG.connect(dbname: 'chitter')
          end
        result = connection.exec('SELECT * FROM peeps;')
        result.map { |peep| peep['message'] }
    end

    def self.post(message:)
        connection = PG.connect(dbname: 'chitter')
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
        # Peep.new
    end   
end