require 'pg'

class DBConnection
    def self.connection
        @connection
    end 

    def self.setup(db)
        @connection = PG.connect|(dbname: db)
    end

    def self.query(sql)
        @connection.exec(sql)
    end 
end 




