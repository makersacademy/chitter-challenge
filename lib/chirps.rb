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

end