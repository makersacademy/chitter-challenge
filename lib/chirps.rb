require 'pg'

class Chirps

    def self.all
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec("SELECT * FROM chirps")
        result.map { |chirp| chirp['chirp'] }
    end

end