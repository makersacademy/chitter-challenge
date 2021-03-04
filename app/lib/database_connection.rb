require 'pg'

class DatabaseConnection
  class << self
    def setup(database)
      self.connection = PG.connect(dbname: database)
    end

    def query(sql_query)
      connection.exec(sql_query)
    end

    private

    attr_accessor :connection
  end
end
