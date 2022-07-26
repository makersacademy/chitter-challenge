require 'pg'

class Peeps 
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        peeps = connection.exec('SELECT * FROM chitter;')
        peeps.map { |peep| peep['name'] }
    end

    def self.create(name:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        
          connection.exec("INSERT INTO chitter (name) VALUES('#{name}')") 
    end
end