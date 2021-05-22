require 'pg'

class Chirps

    def self.all
        if ENV['RACK_ENV'] = 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM chirps")
        result.map { |chirp| chirp['chirp'] }
    end

    def self.create(chirp:)
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        connection.exec("INSERT INTO chirps (chirp) VALUES('#{chirp}')")
    end

end