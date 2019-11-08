require 'pg'

class Chitter
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec('SELECT * FROM chitter')
        result.map { |chitter| chitter['message'] }
      end
      
      def self.create(message:)
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
      
        connection.exec("INSERT INTO chitter (message) VALUES('#{message}')")
      end

end