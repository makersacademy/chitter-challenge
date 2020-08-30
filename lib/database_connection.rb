require 'pg'

class DatabaseConnection

    def self.setup(database)
      @database = PG.connect :dbname => database
    end

    def self.query(sql)
      @database.exec(sql)
    end
end