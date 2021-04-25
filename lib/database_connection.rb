require 'pg'

class DatabaseConnection
  class << self
    attr_reader :connection

    def setup(dbname)
      @connection = PG.connect(dbname: dbname)
    end

    def query(sql)
      @connection.exec(sql)
    end
  end
end
