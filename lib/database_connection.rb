require 'pg'

class DatabaseConnection

    def self.setup(database)
        PG.connect :dbname => database
    end
end